package com.egovernment.biz;

import java.io.Serializable;
import java.util.List;

import com.egovernment.entity.SysModule;
import com.egovernment.entity.SysRole;

public interface SysRoleBiz {
	SysRole addSysRole(SysRole sysRole);

	void delete(SysRole sysRole);

	SysRole findOne(String hql, Object... args);

	List<SysRole> getSysRoles(String hql, Object... args);

	void update(SysRole sysRole);
}
