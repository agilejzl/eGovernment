package com.egovernment.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;

import com.egovernment.biz.SysModuleBiz;
import com.egovernment.dto.Status;
import com.egovernment.entity.SysModule;
import com.opensymphony.xwork2.ActionSupport;

public class SysModuleCl extends ActionSupport implements RequestAware {
	private SysModuleBiz sysModuleBiz;
	private SysModule sysModule;
	private Map<String, Object> request;
	private Long sysModuleId;

	public Long getSysModuleId() {
		return sysModuleId;
	}

	public void setSysModuleId(Long sysModuleId) {
		this.sysModuleId = sysModuleId;
	}

	public void setSysModuleBiz(SysModuleBiz sysModuleBiz) {
		this.sysModuleBiz = sysModuleBiz;
	}

	public SysModule getSysModule() {
		return sysModule;
	}

	public void setSysModule(SysModule sysModule) {
		this.sysModule = sysModule;
	}

	public String moduleAdd() {
		sysModule.setStatus(Status.ACCESS);
		if (sysModuleBiz.addSysModule(sysModule).getId() != null) {
			return SUCCESS;
		}
		return INPUT;
	}
	
	public String moduleDelete(){
		sysModuleBiz.delete(sysModuleBiz.findOne("from SysModule where id =?",
				sysModuleId));
		return SUCCESS;
	}

	public String moduleList() {
		List<SysModule> moduleList = sysModuleBiz.getSysModules(
				" from SysModule where status = ?", Status.ACCESS);
		request.put("moduleList", moduleList);
		return SUCCESS;
	}

	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
}
