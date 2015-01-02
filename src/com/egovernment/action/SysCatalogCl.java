package com.egovernment.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.RequestAware;

import com.egovernment.biz.SysCatalogBiz;
import com.egovernment.dto.MultipleTree;
import com.egovernment.dto.Status;
import com.egovernment.entity.SysCatalog;
import com.egovernment.entity.SysUser;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class SysCatalogCl extends ActionSupport implements RequestAware,
		ApplicationAware {
	private SysCatalogBiz sysCatalogBiz;
	private Map<String, Object> request;
	private Map<String, Object> application;
	private SysCatalog sysCatalog;
	private Long catalogId;

	public SysCatalog getSysCatalog() {
		return sysCatalog;
	}

	public void setSysCatalog(SysCatalog sysCatalog) {
		this.sysCatalog = sysCatalog;
	}

	public Long getCatalogId() {
		return catalogId;
	}

	public void setCatalogId(Long catalogId) {
		this.catalogId = catalogId;
	}

	public Map<String, Object> getApplication() {
		return application;
	}

	public SysCatalogBiz getSysCatalogBiz() {
		return sysCatalogBiz;
	}

	public void setSysCatalogBiz(SysCatalogBiz sysCatalogBiz) {
		this.sysCatalogBiz = sysCatalogBiz;
	}
	
	public String catalogAdd(){
		sysCatalog.setStatus(Status.ACCESS);
		if (sysCatalogBiz.addSysCatalog(sysCatalog).getId() != null) {
			return SUCCESS;
		}
		return INPUT;
	}
	
	public String catalogDelete(){
		sysCatalogBiz.delete(sysCatalogBiz.findOne("from SysCatalog where id =?",
				catalogId));
		return SUCCESS;
	}

	public String catalogChildren() {
		List<SysCatalog> catalogList = sysCatalogBiz.getCatalogList(
				"from SysCatalog where parentId = ?", catalogId);
		request.put("catalogList", catalogList);
		return SUCCESS;
	}

	public String catalogList() {
		List dataList = new ArrayList();
		Map<Long, SysCatalog> catalogMap = (Map<Long, SysCatalog>) application
				.get("catalogMap");
		Set<Long> catalogSet = catalogMap.keySet();
		for (Iterator iterator = catalogSet.iterator(); iterator.hasNext();) {
			SysCatalog catalog = catalogMap.get((Long) iterator.next());
			HashMap<String, Serializable> dataRecord = new HashMap<String, Serializable>();
			dataRecord.put("id", catalog.getId());
			dataRecord.put("name", catalog.getName());
			dataRecord.put("parentId", catalog.getParentId());
			dataList.add(dataRecord);
		}
		String json = MultipleTree.listToJSON(dataList);
		// List<SysCatalog> catalogList = (List<SysCatalog>) application
		// .get("catalogList");
		// JSONArray json = JSONArray.fromObject(catalogList);
		this.writerJson(json.toString());
		return NONE;
	}

	private void writerJson(String text) {
		ActionContext context = ActionContext.getContext();
		if (context == null) {
			return;
		}
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		response.setContentType("application/json;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = null;
		try {
			pw = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		pw.write(text);
		pw.flush();
	}

	public void setApplication(Map<String, Object> application) {
		this.application = application;
	}

	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
}
