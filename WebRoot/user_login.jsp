<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>电子政务网</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
		href="<%=request.getContextPath()%>/bootstrap/css/bootstrap-responsive.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/docs.css">

<script src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-ui.js"></script>
<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.js"></script>
<style type="text/css">
body {
		background-color: #f5f5f5;
}

.form-signin {
		max-width: 300px;
		padding: 19px 29px 29px;
		margin: 0 auto 20px;
		background-color: #fff;
		border: 1px solid #e5e5e5;
		-webkit-border-radius: 5px;
		-moz-border-radius: 5px;
		border-radius: 5px;
		-webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
		-moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
		box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
}

.form-signin .form-signin-heading,.form-signin .checkbox {
		margin-bottom: 10px;
}

.form-signin input[type="text"],.form-signin input[type="password"] {
		font-size: 16px;
		height: auto;
		margin-bottom: 15px;
		padding: 7px 9px;
}
</style>
</head>

<body>
		<header class="jumbotron subhead" id="overview">
		<div class="container">
				<p class="lead">电子政务网</p>
		</div>
		</header>

		<div class="container" style="padding-top: 30px;">
				<form class="form-signin" method="post" action="sys/user_login">
						<c:if test="${requestScope.error != null}">
								<div class="alert alert-error fade in">
										<button type="button" class="close" data-dismiss="alert">×</button>
										<strong>${requestScope.error}</strong>
								</div>
						</c:if>
						<h2 class="form-signin-heading">后台登录</h2>
						<input name="sysUser.name" type="text" class="input-large input-block-level" placeholder="用户名">
						<input name="sysUser.pass" type="password" class="input-large input-block-level" placeholder="密码">
						<!-- <label class="checkbox"> <input type="checkbox" value="remember-me"> 记住我</label> -->
						<button class="btn btn-large btn-primary" style="margin-left: 40px;" type="submit">登录</button>
						<button class="btn btn-large" style="margin-left: 40px;" type="reset">重置</button>
				</form>

		</div>

		<jsp:include page="/sys/buttom.jsp"></jsp:include>
</body>
</html>
