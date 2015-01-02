package com.egovernment.biz;

import java.io.Serializable;
import java.util.List;

import com.egovernment.dto.PageParam;
import com.egovernment.entity.SysUser;

public interface SysUserBiz {
	SysUser register(SysUser sysUser);

	void delete(SysUser sysUser);

	SysUser login(SysUser sysUser);

	SysUser findOne(String hql, Object... args);
	
	void update(Serializable id, SysUser sysUser);

	List<SysUser> getSysUsers(String hql, PageParam pageParam, Object... args);

	Long getSysUserCount(String hql, Object... args);
}
