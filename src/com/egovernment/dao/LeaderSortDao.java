package com.egovernment.dao;

import java.io.Serializable;
import java.util.List;

public interface LeaderSortDao {
	Object save(Object object);

	void delete(Object object);

	void update(Object object);

	int update(String hql, Object... args);

	Object uniqueResult(String hql, Object... args);

	<T> List<T> getListByPage(Class<T> clazz, String hql, Integer offset,
			Integer pageSize, Object... args);

	<T> T getById(Class<T> clazz, Serializable id);
}
