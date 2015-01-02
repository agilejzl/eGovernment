package com.egovernment.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.egovernment.dao.BaseDao;

public class BaseDaoImpl implements BaseDao {
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Object save(Object object) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.save(object);
		tx.commit();
		return object;
	}

	public void delete(Object object) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.delete(object);
		tx.commit();
	}

	public void update(Object object) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.update(object);
		tx.commit();
	}

	public int update(String hql, Object... args) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		Query query = this.setParameter(session, hql, args);
		query = session.createQuery(hql);
		int i = query.executeUpdate();
		tx.commit();
		return i;
	}

	public <T> T getById(Class<T> clazz, Serializable id) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		T t = (T) session.get(clazz, id);
		return t;
	}

	public Object uniqueResult(String hql, Object... args) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		Query query = this.setParameter(session, hql, args);
		Object o = query.uniqueResult();
		return o;
	}

	public <T> List<T> getList(Class<T> clazz, String hql, Object... args) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		Query query = this.setParameter(session, hql, args);
		List<T> list = query.list();
		return list;
	}

	public <T> List<T> getListByPage(Class<T> clazz, String hql,
			Integer offset, Integer pageSize, Object... args) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		Query query = session.createQuery(hql).setFirstResult(offset)
				.setMaxResults(pageSize);
		List<T> list = query.list();
		return list;
	}

	public Query setParameter(Session session, String hql, Object... args) {
		Query query = session.createQuery(hql);
		for (int i = 0; i < args.length; i++) {
			query.setParameter(i, args[i]);
		}
		return query;
	}

}
