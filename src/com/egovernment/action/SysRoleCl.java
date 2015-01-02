package com.egovernment.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;

import com.egovernment.biz.SysModuleBiz;
import com.egovernment.biz.SysRoleBiz;
import com.egovernment.dto.Status;
import com.egovernment.entity.SysModule;
import com.egovernment.entity.SysRole;
import com.opensymphony.xwork2.ActionSupport;

public class SysRoleCl extends ActionSupport implements RequestAware {
	private SysRoleBiz sysRoleBiz;
	private SysModuleBiz sysModuleBiz;
	private Map<String, Object> request;
	private SysRole sysRole;
	private Long sysRoleId;
	private Long[] moduleIdList;

	public Long[] getModuleIdList() {
		return moduleIdList;
	}

	public void setModuleIdList(Long[] moduleIdList) {
		this.moduleIdList = moduleIdList;
	}

	public Long getSysRoleId() {
		return sysRoleId;
	}

	public void setSysRoleId(Long sysRoleId) {
		this.sysRoleId = sysRoleId;
	}

	public SysRole getSysRole() {
		return sysRole;
	}

	public void setSysRole(SysRole sysRole) {
		this.sysRole = sysRole;
	}

	public SysRoleBiz getSysRoleBiz() {
		return sysRoleBiz;
	}

	public void setSysModuleBiz(SysModuleBiz sysModuleBiz) {
		this.sysModuleBiz = sysModuleBiz;
	}

	public void setSysRoleBiz(SysRoleBiz sysRoleBiz) {
		this.sysRoleBiz = sysRoleBiz;
	}

	public String roleUpdate() {
		if (moduleIdList != null && moduleIdList.length > 0) {
			List<SysModule> moduleList = new ArrayList<SysModule>(
					moduleIdList.length);
			for (int i = 0; i < moduleIdList.length; i++) {
				moduleList.add(sysModuleBiz.findOne(
						"from SysModule where id = ?", moduleIdList[i]));
			}
			sysRole.setSysModules(moduleList);
		}
		sysRoleBiz.update(sysRole);
		return SUCCESS;
	}

	public String roleView() {
		List<SysModule> moduleList = sysModuleBiz.getSysModules(
				" from SysModule where status = ?", Status.ACCESS);
		request.put("moduleList", moduleList);

		SysRole sysRole = sysRoleBiz.findOne("from SysRole where id =?",
				sysRoleId);
		request.put("sysRole", sysRole);
		return SUCCESS;
	}

	public String roleAdd() {
		sysRole.setStatus(Status.ACCESS);
		if (sysRoleBiz.addSysRole(sysRole).getId() != null) {
			return SUCCESS;
		}
		return INPUT;
	}

	public String roleDelete() {
		sysRoleBiz.delete(sysRoleBiz.findOne("from SysRole where id = ?",
				sysRoleId));
		return SUCCESS;
	}

	public String roleList() {
		List<SysRole> roleList = sysRoleBiz.getSysRoles("from SysRole");
		request.put("roleList", roleList);
		return SUCCESS;
	}

	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
}
