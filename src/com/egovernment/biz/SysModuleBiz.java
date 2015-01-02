package com.egovernment.biz;

import java.util.List;

import com.egovernment.entity.SysModule;
import com.egovernment.entity.SysUser;

public interface SysModuleBiz {
	SysModule addSysModule(SysModule sysModule);
	
	void delete(SysModule sysModule);
	
	SysModule findOne(String hql, Object... args);
	
	List<SysModule> getSysModules(String hql, Object... args);
}
