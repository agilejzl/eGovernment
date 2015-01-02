<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<title><s:property value="%{@com.egovernment.util.PropertyUtil@get('app.name')}" /></title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
		href="<%=request.getContextPath()%>/bootstrap/css/bootstrap-responsive.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/docs.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/prettify.css">

<script src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/js/application.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.form.js"></script>

<jsp:include page="/sys/top.jsp"></jsp:include>

<div class="container">
		<div class="row">
				<div class="span2 bs-docs-sidebar" style="min-height: 350px;">
								<ul class="nav nav-list affix-top">
										<jsp:include page="/sys/feedback_sort.jsp"></jsp:include>
								</ul>
						</div>

						<div class="span10 feedback-list">意见反馈列表</div>
		</div>
</div>
<jsp:include page="/sys/buttom.jsp"></jsp:include>