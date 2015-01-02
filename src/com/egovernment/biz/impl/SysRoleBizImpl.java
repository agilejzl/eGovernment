package com.egovernment.biz.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.BeanUtils;

import com.egovernment.biz.SysRoleBiz;
import com.egovernment.dao.SysRoleDao;
import com.egovernment.entity.SysRole;
import com.egovernment.entity.SysUser;

public class SysRoleBizImpl implements SysRoleBiz {
	private SysRoleDao sysRoleDao;

	public void setSysRoleDao(SysRoleDao sysRoleDao) {
		this.sysRoleDao = sysRoleDao;
	}

	public SysRole addSysRole(SysRole sysRole) {
		return (SysRole) sysRoleDao.save(sysRole);
	}

	public void delete(SysRole sysRole) {
		sysRoleDao.delete(sysRole);
	}

	public SysRole findOne(String hql, Object... args) {
		return (SysRole) sysRoleDao.uniqueResult(hql, args);
	}

	public List<SysRole> getSysRoles(String hql, Object... args) {
		return sysRoleDao.getList(SysRole.class, hql, args);
	}

	public void update(SysRole sysRole) {
		sysRoleDao.update(sysRole);
	}
}
