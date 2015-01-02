<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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
<title><s:property value="%{@com.egovernment.util.PropertyUtil@get('app.name')}" /></title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
		href="<%=request.getContextPath()%>/bootstrap/css/bootstrap-responsive.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/docs.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/prettify.css">

<script src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/js/application.js"></script>

<script type="text/javascript">
	/* $(function() {
		$(".nav-collapse li").click(function() {
			$(".nav-collapse .active").removeClass("active");
			$(this).addClass("active");
			url = $(this).find("a").attr("href");
			htmlobj = $.ajax({
				url : url,
				async : false,
				dataType : "html",
				success : function(data, textStatus) {
					//document.location.href = url;
				}, 
				error : function(response, status, xhr) {
					console.log(url + "加载失败");
				},
				complete : function(XMLHttpRequest, textStatus) {
				}
			});
			$(".main").html(htmlobj.responseText);
			return false;
		});

		//设置默认页面
		if (!$(".main").html()) {
			$(".nav-collapse .active").removeClass("active");
			li = $(".nav-collapse li").first();
			li.addClass("active");
			//url = li.find("a").attr("href");
			url = "sys/user_manage";
			$(".main").load(url);
		}

	}); */
</script>
</head>

<jsp:include page="/sys/top.jsp"></jsp:include>

<div class="container">
		<div class="row">
				<div class="span9 offset2">
						<br />
						<div class="alert alert-block alert-info fade in">
								<button type="button" class="close" data-dismiss="alert">×</button>
								<strong> 欢迎您，这里是<s:property value="%{@com.egovernment.util.PropertyUtil@get('app.name')}" />。
										<br> <s:if test="#session.currUser.sysRoles.size == 0">您没有任何模块的访问权限，请联系管理员！
										</s:if> <s:else>
										您拥有的角色有：<s:iterator value="#session.currUser.sysRoles" var="sysRole">
														<s:property value="#sysRole.name" />
												</s:iterator>，<br> 有访问以下模块的权限：<s:iterator value="#session.currUser.allModules" var="sysModule">
														<s:property value="#sysModule.name" />
												</s:iterator>。
										</s:else> </strong>
						</div>
				</div>
		</div>
</div>

<jsp:include page="/sys/buttom.jsp"></jsp:include>

</body>
</html>
