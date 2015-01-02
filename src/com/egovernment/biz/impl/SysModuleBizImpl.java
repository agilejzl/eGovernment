package com.egovernment.biz.impl;

import java.util.List;

import com.egovernment.biz.SysModuleBiz;
import com.egovernment.dao.SysModuleDao;
import com.egovernment.entity.SysModule;

public class SysModuleBizImpl implements SysModuleBiz {
	private SysModuleDao sysModuleDao;

	public void setSysModuleDao(SysModuleDao sysModuleDao) {
		this.sysModuleDao = sysModuleDao;
	}

	public SysModule addSysModule(SysModule sysModule) {
		return (SysModule) sysModuleDao.save(sysModule);
	}
	
	public void delete(SysModule sysModule) {
		sysModuleDao.delete(sysModule);
	}

	public SysModule findOne(String hql, Object... args) {
		return (SysModule) sysModuleDao.uniqueResult(hql, args);
	}

	public List<SysModule> getSysModules(String hql, Object... args) {
		return sysModuleDao.getList(SysModule.class, hql, args);
	}

}
