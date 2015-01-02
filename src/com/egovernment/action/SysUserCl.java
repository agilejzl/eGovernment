package com.egovernment.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.egovernment.biz.SysRoleBiz;
import com.egovernment.biz.SysUserBiz;
import com.egovernment.dto.PageParam;
import com.egovernment.dto.Status;
import com.egovernment.entity.SysModule;
import com.egovernment.entity.SysRole;
import com.egovernment.entity.SysUser;
import com.egovernment.util.PropertyUtil;
import com.opensymphony.xwork2.ActionSupport;

public class SysUserCl extends ActionSupport implements RequestAware,
		SessionAware {
	public static final String CURR_USER = "currUser";
	private SysUserBiz sysUserBiz;
	private SysRoleBiz sysRoleBiz;
	private SysUser sysUser;
	private Long sysUserId;
	private Map<String, Object> request;
	private Map<String, Object> session;
	private Integer pageNow;
	private Integer pageSize;
	private Long[] roleIdList;

	public Long[] getRoleIdList() {
		return roleIdList;
	}

	public void setRoleIdList(Long[] roleIdList) {
		this.roleIdList = roleIdList;
	}

	public void setSysRoleBiz(SysRoleBiz sysRoleBiz) {
		this.sysRoleBiz = sysRoleBiz;
	}

	public Long getSysUserId() {
		return sysUserId;
	}

	public void setSysUserId(Long sysUserId) {
		this.sysUserId = sysUserId;
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

	public void setSysUserBiz(SysUserBiz sysUserBiz) {
		this.sysUserBiz = sysUserBiz;
	}

	public SysUser getSysUser() {
		return sysUser;
	}

	public void setSysUser(SysUser sysUser) {
		this.sysUser = sysUser;
	}

	public String index() {
		return SUCCESS;
	}

	public String userList() {
		Long totalCount = sysUserBiz
				.getSysUserCount("select count(*) from SysUser");
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

		List<SysUser> userList = sysUserBiz.getSysUsers(" from SysUser",
				pageParam);
		request.put("pageParam", pageParam);
		request.put("userList", userList);
		return SUCCESS;
	}

	public String userRegister() {
		if (sysUserBiz.findOne("from SysUser where name =?", sysUser.getName()) == null) {
			sysUser.setStatus(Status.WAIT);
			SysUser user = sysUserBiz.register(sysUser);
			if (user != null) {
				return SUCCESS;
			}
		}
		request.put("error", "用户名已经被使用！");
		return INPUT;
	}

	public String userView() {
		List<SysRole> roleList = sysRoleBiz.getSysRoles(
				"from SysRole where status = ?", Status.ACCESS);
		request.put("roleList", roleList);
		SysUser sysUser = sysUserBiz.findOne("from SysUser where id =?",
				sysUserId);
		request.put("sysUser", sysUser);
		return SUCCESS;
	}

	public String userUpdate() {
		if (roleIdList != null && roleIdList.length > 0) {
			List<SysRole> roleList = new ArrayList<SysRole>(roleIdList.length);
			for (int i = 0; i < roleIdList.length; i++) {
				roleList.add(sysRoleBiz.findOne("from SysRole where id = ?",
						roleIdList[i]));
			}
			sysUser.setSysRoles(roleList);
		}
		sysUserBiz.update(sysUser.getId(), sysUser);
		return SUCCESS;
	}

	public String userDelete() {
		sysUserBiz.delete(sysUserBiz.findOne("from SysUser where id =?",
				sysUserId));
		return SUCCESS;
	}

	public String userDeleteBatch() {
		sysUserBiz.delete(sysUserBiz.findOne("from SysUser where id =?",
				sysUserId));
		return NONE;
	}

	public String userLogin() {
		if (session.get(CURR_USER) != null) {
			request.put("message", PropertyUtil.get("app.name") + "欢迎您回来！");
			return SUCCESS;
		} else {
			SysUser user = sysUserBiz.login(sysUser);
			if (user != null) {
				if (!Status.ACCESS.equals(user.getStatus())) {
					request.put("error", "账号目前不能使用，请联系管理员！");
					return INPUT;
				} else {
					session.put(CURR_USER, user);
					request.put("message", "欢迎您" + user.getName() + "，这里是"
							+ PropertyUtil.get("app.name") + "。");
					return SUCCESS;
				}
			} else {
				request.put("error", "用户名或密码不匹配！");
				return INPUT;
			}
		}
	}

	public String userLogout() {
		session.remove(CURR_USER);
		return SUCCESS;
	}

	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
}
