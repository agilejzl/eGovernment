<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">
				<div class="container">
						<button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
								<span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
						</button>
						<a class="brand" href="<%=request.getContextPath()%>/sys/index.jsp"><s:property value="%{@com.egovernment.util.PropertyUtil@get('app.name')}" /></a>
						<div class="nav-collapse collapse">
								<ul class="nav">
										<li class=""><a href="<%=request.getContextPath()%>/sys/index.jsp">首页</a></li>
										<s:iterator value="#session.currUser.allModules" var="module">
												<li class=""><a href="<%=request.getContextPath()%><s:property value="#module.link"/>"><s:property
																		value="#module.name" /> </a>
												</li>
										</s:iterator>
								</ul>
								<p class="navbar-text pull-right">
										<s:if test="#session.currUser">
												欢迎您，<a href="" class="navbar-link"><s:property value="#session.currUser.name" /> </a>
												<a href="<%=request.getContextPath()%>/sys/user_logout">&nbsp;退出 </a>
										</s:if>
								</p>
						</div>
				</div>
		</div>
</div>

<header class="jumbotron subhead" id="overview">
		<div class="container">
				<p class="lead"><s:property value="%{@com.egovernment.util.PropertyUtil@get('app.name')}" /></p>
				<%-- <s:iterator value="#session.currUser.sysRoles" var="sysRole">
						<s:iterator value="#sysRole.sysModules" var="sysModule">
								<s:property value="#sysModule.name" />
						</s:iterator>
				</s:iterator> --%>
				<%-- <s:iterator value="#session.currUser.allModules" var="sysModule">
						<s:property value="#sysModule.name" />
				</s:iterator> --%>
		</div>
</header>