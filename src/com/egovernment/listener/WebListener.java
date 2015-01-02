package com.egovernment.listener;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.egovernment.biz.SysCatalogBiz;
import com.egovernment.biz.SysModuleBiz;
import com.egovernment.dto.Status;
import com.egovernment.entity.SysCatalog;
import com.egovernment.entity.SysModule;

public class WebListener implements ServletContextListener {

	public void contextInitialized(ServletContextEvent sce) {
		ApplicationContext applicationContext = WebApplicationContextUtils
				.getWebApplicationContext(sce.getServletContext());
		SysCatalogBiz sysCatalogBiz = (SysCatalogBiz) applicationContext
				.getBean("sysCatalogBiz");
		List<SysCatalog> catalogList = sysCatalogBiz
				.getCatalogList(" from SysCatalog");
		Map<Long, SysCatalog> catalogMap = new HashMap<Long, SysCatalog>(
				catalogList.size());
		for (SysCatalog sysCatalog : catalogList) {
			catalogMap.put(sysCatalog.getId(), sysCatalog);
		}
		ServletContext application = sce.getServletContext();
		application.setAttribute("catalogMap", catalogMap);

		// 前台首页导航目录
		List<SysCatalog> catalogList_nav = sysCatalogBiz
				.getCatalogList("from SysCatalog where level = 1 and name != '政府网站' and name != '网站链接'");
		application.setAttribute("catalogList_nav", catalogList_nav);
		// 后台首页导航目录
		SysModuleBiz sysModuleBiz = (SysModuleBiz) applicationContext
				.getBean("sysModuleBiz");
		List<SysModule> moduleList_nav = sysModuleBiz.getSysModules(
				"from SysModule where status = ?", Status.ACCESS);
		application.setAttribute("moduleList_nav", moduleList_nav);
	}

	public void contextDestroyed(ServletContextEvent sce) {
	}
}
