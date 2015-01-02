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

import com.egovernment.biz.LeaderBiz;
import com.egovernment.dto.MultipleTree;
import com.egovernment.entity.Leader;
import com.egovernment.entity.LeaderSort;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LeaderCl extends ActionSupport implements RequestAware {
	private LeaderBiz leaderBiz;
	private Long leaderSortId;
	private Map<String, Object> request;

	public Long getLeaderSortId() {
		return leaderSortId;
	}

	public void setLeaderSortId(Long leaderSortId) {
		this.leaderSortId = leaderSortId;
	}

	public LeaderBiz getLeaderBiz() {
		return leaderBiz;
	}

	public void setLeaderBiz(LeaderBiz leaderBiz) {
		this.leaderBiz = leaderBiz;
	}

	public String leaderList() {
		List<Leader> leaderList = leaderBiz.getLeaders(
				"from Leader where leaderSort_id=?", leaderSortId);
		request.put("leaderList", leaderList);
		return SUCCESS;
	}

	public String leaderSortList() {
		List dataList = new ArrayList();
		List<LeaderSort> leaderSortList = leaderBiz
				.getLeaderSortList("from LeaderSort");
		HashMap<String, Serializable> dataRecord = new HashMap<String, Serializable>();
		dataRecord.put("id", 0L);
		dataRecord.put("name", "领导信箱");
		dataList.add(dataRecord);
		for (LeaderSort leaderSort : leaderSortList) {
			dataRecord = new HashMap<String, Serializable>();
			dataRecord.put("id", leaderSort.getId());
			dataRecord.put("name", leaderSort.getPosition());
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
