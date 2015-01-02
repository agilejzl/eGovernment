package com.egovernment.dao;

import java.util.List;

public interface SysModuleDao {
	Object save(Object object);

	void delete(Object object);

	void update(Object object);

	int update(String hql, Object... args);

	Object uniqueResult(String hql, Object... args);

	<T> List<T> getList(Class<T> clazz, String hql, Object... args);
}
