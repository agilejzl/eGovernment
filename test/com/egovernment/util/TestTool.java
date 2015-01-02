package com.egovernment.util;

public class TestTool {

	public void desAndMd5() {
		String src = "需要进行加密的字符串";
		String src1 = DesUtil.encrypt(src);
		String src2 = DesUtil.decrypt(src1);
		String src3 = Md5Util.getMd5(src1);
		System.out.println("DES加密前的字符：" + src + "，长度：" + src.length());
		System.out.println("DES加密后的字符：" + src1 + "，长度：" + src1.length());
		System.out.println("DES解密后的字符：" + src2 + "，长度：" + src2.length());
		System.out.println("MD5加密后的字符：" + src3 + "，长度：" + src3.length());
	}

	public static String subStr(String str, int n) {
		return (str.length() <= n) ? str : str.substring(0, n);
	}
}
