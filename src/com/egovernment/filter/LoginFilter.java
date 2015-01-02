package com.egovernment.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.egovernment.action.SysUserCl;

public class LoginFilter implements Filter {

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession();
		// 验证是否已经登录session
		if (session.getAttribute(SysUserCl.CURR_USER) == null) {
			// 是否请求登录后台
			if ("/sys/user_login".equals(req.getServletPath())) {
				chain.doFilter(req, res);
			} else {
				req.setAttribute("error", "请先登录，再执行之前的操作！");
				req.getRequestDispatcher("/user_login.jsp").forward(req, res);
			}
		} else {
			chain.doFilter(req, res);
		}
	}

	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("后台登录验证已启用...");
	}

}
