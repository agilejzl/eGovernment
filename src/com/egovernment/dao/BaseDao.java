package com.egovernment.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

public interface BaseDao {

	Object save(Object object);

	void delete(Object object);

	void update(Object object);

	int update(String hql, Object... args);

	Object uniqueResult(String hql, Object... args);

	<T> List<T> getList(Class<T> clazz, String hql, Object... args);

	Query setParameter(Session session, String hql, Object... args);

	<T> T getById(Class<T> clazz, Serializable id);
}
