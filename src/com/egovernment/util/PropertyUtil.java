package com.egovernment.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

/**
 * 此类借用了hibernate读取properties文件的代码， 可以解析占位符比如$
 */
public class PropertyUtil {
	private static final String PLACEHOLDER_START = "${";
	private static String FILE_PATH = "app_config.properties";
	private static Properties pro;

	public static String get(String key) {
		pro = buildProperty(FILE_PATH);
		resolvePlaceHolders(pro);
		if (pro.containsKey(key)) {
			return pro.getProperty(key);
		} else {
			return "";
		}
	}

	/**
	 * 解析占位符
	 * 
	 * @param properties
	 */
	public static void resolvePlaceHolders(Properties properties) {
		Iterator itr = properties.entrySet().iterator();
		while (itr.hasNext()) {
			final Map.Entry entry = (Map.Entry) itr.next();
			final Object value = entry.getValue();
			if (value != null && String.class.isInstance(value)) {
				final String resolved = resolvePlaceHolder((String) value);
				if (!value.equals(resolved)) {
					if (resolved == null) {
						itr.remove();
					} else {
						entry.setValue(resolved);
					}
				}
			}
		}
	}

	/**
	 * 解析占位符具体操作
	 * 
	 * @param property
	 * @return
	 */
	public static String resolvePlaceHolder(String property) {
		if (property.indexOf(PLACEHOLDER_START) < 0) {
			return property;
		}
		StringBuffer buff = new StringBuffer();
		char[] chars = property.toCharArray();
		for (int pos = 0; pos < chars.length; pos++) {
			if (chars[pos] == '$') {
				// peek ahead
				if (chars[pos + 1] == '{') {
					// we have a placeholder, spin forward till we find the end
					String systemPropertyName = "";
					int x = pos + 2;
					for (; x < chars.length && chars[x] != '}'; x++) {
						systemPropertyName += chars[x];
						// if we reach the end of the string w/o finding the
						// matching end, that is an exception
						if (x == chars.length - 1) {
							throw new IllegalArgumentException(
									"unmatched placeholder start [" + property
											+ "]");
						}
					}
					String systemProperty = extractFromSystem(systemPropertyName);
					buff.append(systemProperty == null ? "" : systemProperty);
					pos = x + 1;
					// make sure spinning forward did not put us past the end of
					// the buffer...
					if (pos >= chars.length) {
						break;
					}
				}
			}
			buff.append(chars[pos]);
		}
		String rtn = buff.toString();
		return isEmpty(rtn) ? null : rtn;
	}

	/**
	 * 构造properties文件
	 * 
	 * @param path
	 * @return
	 */
	public static Properties buildProperty(String path) {
		InputStream is = getResourceAsStream(FILE_PATH);
		pro = new Properties();
		try {
			pro.load(is);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return pro;
	}

	/**
	 * 构造properties文件的流
	 * 
	 * @param resource
	 * @return
	 */
	public static InputStream getResourceAsStream(String resource) {
		String stripped = resource.startsWith("/") ? resource.substring(1)
				: resource;
		InputStream stream = null;
		ClassLoader classLoader = Thread.currentThread()
				.getContextClassLoader();
		if (classLoader != null) {
			stream = classLoader.getResourceAsStream(stripped);
		}
		if (stream == null) {
			stream = PropertyUtil.class.getResourceAsStream(resource);
		}
		if (stream == null) {
			stream = PropertyUtil.class.getClassLoader().getResourceAsStream(
					stripped);
		}
		if (stream == null) {
			throw new RuntimeException(resource + "没找到！");
		}
		return stream;
	}

	/**
	 * 获得系统属性，也可以选择从别的地方获取值
	 * 
	 * @param systemPropertyName
	 * @return
	 */
	private static String extractFromSystem(String systemPropertyName) {
		try {
			return System.getProperty(systemPropertyName);
		} catch (Throwable t) {
			return null;
		}
	}

	/**
	 * 判断字符串的空(null或者.length=0)
	 * 
	 * @param string
	 * @return
	 */
	public static boolean isEmpty(String string) {
		return string == null || string.length() == 0;
	}

}