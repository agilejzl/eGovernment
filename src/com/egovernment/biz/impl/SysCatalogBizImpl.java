package com.egovernment.biz.impl;

import java.util.List;

import com.egovernment.biz.SysCatalogBiz;
import com.egovernment.dao.SysCatalogDao;
import com.egovernment.entity.SysCatalog;
import com.egovernment.entity.SysModule;

public class SysCatalogBizImpl implements SysCatalogBiz {
	private SysCatalogDao sysCatalogDao;

	public void setSysCatalogDao(SysCatalogDao sysCatalogDao) {
		this.sysCatalogDao = sysCatalogDao;
	}

	public SysCatalog addSysCatalog(SysCatalog sysCatalog) {
		return (SysCatalog) sysCatalogDao.save(sysCatalog);
	}

	public void delete(SysCatalog sysCatalog) {
		sysCatalogDao.delete(sysCatalog);
	}

	public List<SysCatalog> getCatalogList(String hql, Object... args) {
		return sysCatalogDao.getList(SysCatalog.class, hql, args);
	}

	public SysCatalog findOne(String hql, Object... args) {
		return (SysCatalog) sysCatalogDao.uniqueResult(hql, args);
	}

}
