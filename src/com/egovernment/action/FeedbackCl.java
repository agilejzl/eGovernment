package com.egovernment.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;

import com.egovernment.biz.FeedbackBiz;
import com.egovernment.biz.SysCatalogBiz;
import com.egovernment.dto.MultipleTree;
import com.egovernment.dto.PageParam;
import com.egovernment.entity.Feedback;
import com.egovernment.entity.SysCatalog;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class FeedbackCl extends ActionSupport implements RequestAware {
	private FeedbackBiz feedbackBiz;
	private SysCatalogBiz sysCatalogBiz;
	private Long feedbackId;
	private Long catalogId;
	private Map<String, Object> request;
	private Integer pageNow;
	private Integer pageSize;
	private Feedback feedback;

	public FeedbackBiz getFeedbackBiz() {
		return feedbackBiz;
	}

	public void setFeedbackBiz(FeedbackBiz feedbackBiz) {
		this.feedbackBiz = feedbackBiz;
	}

	public SysCatalogBiz getSysCatalogBiz() {
		return sysCatalogBiz;
	}

	public void setSysCatalogBiz(SysCatalogBiz sysCatalogBiz) {
		this.sysCatalogBiz = sysCatalogBiz;
	}

	public Long getFeedbackId() {
		return feedbackId;
	}

	public void setFeedbackId(Long feedbackId) {
		this.feedbackId = feedbackId;
	}

	public Long getCatalogId() {
		return catalogId;
	}

	public void setCatalogId(Long catalogId) {
		this.catalogId = catalogId;
	}

	public Integer getPageNow() {
		return pageNow;
	}

	public void setPageNow(Integer pageNow) {
		this.pageNow = pageNow;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Feedback getFeedback() {
		return feedback;
	}

	public void setFeedback(Feedback feedback) {
		this.feedback = feedback;
	}

	public String feedbackGet() {
		Feedback feedback = feedbackBiz.getFeedbackById(feedbackId);
		request.put("feedback", feedback);
		return SUCCESS;
	}

	public String feedbackAdd() {
		feedback = feedbackBiz.publishFeedback(feedback);
		if (feedback != null) {
			return NONE;
		}
		return INPUT;
	}

	public String feedbackList() {
		Long totalCount = feedbackBiz
				.getFeedbackCount("select count(*) from Feedback where sysCatalog.id="
						+ catalogId);
		PageParam pageParam = new PageParam();
		pageParam.setTotalCount(totalCount);

		if (pageNow != null && pageNow > 0
				&& pageNow <= pageParam.getPageCount()) {
			pageParam.setPageNow(pageNow);
		} else {
			pageParam.setPageNow(1);
		}
		if (pageSize != null && pageSize > 0 && pageSize <= 20) {
			pageParam.setPageSize(pageSize);
		} else {
			pageParam.setPageSize(5);
		}

		List<Feedback> feedbackList = feedbackBiz.getFeedbacks(
				"from Feedback where sysCatalog.id = " + catalogId, pageParam);
		request.put("pageParam", pageParam);
		request.put("feedbackList", feedbackList);
		request.put("catalogId", catalogId);
		return SUCCESS;
	}

	public String feedbackSortList() {
		List dataList = new ArrayList();
		List<SysCatalog> catalogList = sysCatalogBiz.getCatalogList(
				"from SysCatalog where name=?", "意见反馈");
		HashMap<String, Serializable> dataRecord = new HashMap<String, Serializable>();
		dataRecord.put("id", 0L);
		dataRecord.put("name", "信息反馈");
		dataList.add(dataRecord);
		for (SysCatalog catalog : catalogList) {
			dataRecord = new HashMap<String, Serializable>();
			dataRecord.put("id", catalog.getId());
			dataRecord.put("name", catalog.getName());
			dataRecord.put("parentId", 0L);
			dataList.add(dataRecord);
		}
		String json = MultipleTree.listToJSON(dataList);
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

	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

}
