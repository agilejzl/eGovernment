package com.egovernment.biz;

import java.util.List;

import com.egovernment.entity.SysCatalog;
import com.egovernment.entity.SysModule;

public interface SysCatalogBiz {
	SysCatalog addSysCatalog(SysCatalog sysCatalog);

	void delete(SysCatalog sysCatalog);

	SysCatalog findOne(String hql, Object... args);

	List<SysCatalog> getCatalogList(String hql, Object... args);

}
