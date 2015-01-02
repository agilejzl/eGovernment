package com.egovernment.util;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.egovernment.biz.SysCatalogBiz;
import com.egovernment.entity.SysCatalog;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class TestJsonUtil {
	@Resource
	private SysCatalogBiz sysCatalogBiz;

	@Test
	public void test() {

		List<SysCatalog> catalogList = sysCatalogBiz
				.getCatalogList(" from SysCatalog");
		// JSONArray json = JSONArray.fromObject(catalogList);
		// System.out.println(json);
		// List dataList = new ArrayList();
		JSONArray jsonArray = new JSONArray();
		for (SysCatalog catalog : catalogList) {
			HashMap<String, Serializable> dataRecord = new HashMap<String, Serializable>();
			dataRecord.put("id", catalog.getId());
			dataRecord.put("name", catalog.getName());
			dataRecord.put("parentId", catalog.getParentId());
			// dataList.add(dataRecord);
			JSONObject jsonMap = JSONObject.fromObject(dataRecord);
			jsonArray.add(jsonMap);
		}
		// System.out.println(MultipleTree.listToJSON(dataList));
		System.out.println(jsonArray.toString());
	}
}
