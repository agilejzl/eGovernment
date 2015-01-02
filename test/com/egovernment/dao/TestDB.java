package com.egovernment.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.egovernment.biz.SysUserBiz;
import com.egovernment.entity.SysUser;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class TestDB extends AbstractJUnit4SpringContextTests {
	@Resource
	private SysUserBiz sysUserBiz;

	@Test
	public void testRegister() {
		SysUser sysUser = new SysUser("admin", "admin");
		// System.out.println(sysUserBiz.register(sysUser));
		SysUser user = sysUserBiz.login(sysUser);
		System.out.println(user);
	}

	public static void main(String[] args) {
		String url = "jdbc:sqlserver://127.0.0.1:1433;databaseName=e_government";
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection conn = DriverManager.getConnection(url, "sa", "123456");
			System.out.println("ok");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
