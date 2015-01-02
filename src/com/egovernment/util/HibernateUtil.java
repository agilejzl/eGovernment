package com.egovernment.util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {
	private static SessionFactory sessionFactory;
	static {
		if (sessionFactory == null) {
			Configuration cfg = new Configuration().configure();
			sessionFactory = cfg.buildSessionFactory();
		}
	}

	private HibernateUtil() {
	}

	public static Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public static void closeSessionFactory() {
		if (sessionFactory != null) {
			sessionFactory.close();
			sessionFactory = null;
		}
	}

	public static void closeSeesion(Session session) {
		if (session != null) {
			session.close();
			session = null;
		}
	}
}
