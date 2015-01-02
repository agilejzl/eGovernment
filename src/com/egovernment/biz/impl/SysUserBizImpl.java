package com.egovernment.biz.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.BeanUtils;

import com.egovernment.biz.SysUserBiz;
import com.egovernment.dao.SysUserDao;
import com.egovernment.dto.PageParam;
import com.egovernment.entity.SysUser;
import com.egovernment.util.DesUtil;

public class SysUserBizImpl implements SysUserBiz {
	private SysUserDao sysUserDao;

	public void setSysUserDao(SysUserDao sysUserDao) {
		this.sysUserDao = sysUserDao;
	}

	public SysUser register(SysUser sysUser) {
		sysUser.setPass(DesUtil.encrypt(sysUser.getPass()));
		return (SysUser) sysUserDao.save(sysUser);
	}

	public void delete(SysUser sysUser) {
		sysUserDao.delete(sysUser);
	}

	public SysUser login(SysUser sysUser) {
		sysUser.setPass(DesUtil.encrypt(sysUser.getPass()));
		return (SysUser) sysUserDao.uniqueResult(
				" from  SysUser where name=? and pass=?", sysUser.getName(),
				sysUser.getPass());
	}

	public SysUser findOne(String hql, Object... args) {
		return (SysUser) sysUserDao.uniqueResult(hql, args);
	}

	public void update(Serializable id, SysUser sysUser) {
		SysUser dbUser = sysUserDao.getById(SysUser.class, id);
		// 复制对象属性值时忽略id、pass属性，可避免pass被恶意修改
		BeanUtils
				.copyProperties(sysUser, dbUser, new String[] { "id", "pass" });
		sysUserDao.update(dbUser);
	}

	public List<SysUser> getSysUsers(String hql, PageParam pageParam,
			Object... args) {
		Integer offset = (int) ((pageParam.getPageNow() - 1) * pageParam
				.getPageSize());
		Integer pageSize = pageParam.getPageSize();
		return sysUserDao.getListByPage(SysUser.class, hql, offset, pageSize,
				args);
	}

	public Long getSysUserCount(String hql, Object... args) {
		return (Long) sysUserDao.uniqueResult(hql, args);
	}

}
