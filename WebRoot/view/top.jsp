<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<style type="text/css">
#scrollUp {
		position: fixed;
		z-index: 6666;
		bottom: 20px;
		right: 20px;
		height: 38px;
		width: 38px;
		background: url("img/top.png") no-repeat;
}
</style>

<script type="text/javascript">
	$(function() {
		function gotoTop(min_height) {
			$("#scrollUp").click(function() {
				$('html,body').animate({
					scrollTop : 0
				}, 100);
			});
			//获取页面的最小高度，无传入值则默认为100像素
			min_height ? min_height = min_height : min_height = 100;
			//为窗口的scroll事件绑定处理函数
			$(window).scroll(function() {
				//获取窗口的滚动条的垂直位置
				var s = $(window).scrollTop();
				//当窗口的滚动条的垂直位置大于页面的最小高度时，让返回顶部元素渐现，否则渐隐
				if (s > min_height) {
					$("#scrollUp").fadeIn(100);
				} else {
					$("#scrollUp").fadeOut(200);
				}
			});
		}
		gotoTop();
	});
</script>

<a id="scrollUp" href="#top" class="hide"></a>

<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">
				<div class="container">
						<button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
								<span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
						</button>
						<a class="brand" href="<%=request.getContextPath()%>"><s:property value="%{@com.egovernment.util.PropertyUtil@get('app.name')}" /></a>
						<div class="nav-collapse collapse">
								<ul class="nav">
										<li class=""><a href="<%=request.getContextPath()%>">首页</a>
										</li>
										<s:iterator value="#application.catalogList_nav" var="catalog">
												<li class=""><a
														href="<%=request.getContextPath()%>/view/catalog_get?catalogId=<s:property value="#catalog.id"/>"><s:property
																		value="#catalog.name" /> </a>
												</li>
										</s:iterator>
								</ul>
								<p class="navbar-text pull-right">
										<s:if test="#session.currUser">
												欢迎您，<a href="" class="navbar-link"><s:property value="#session.currUser.trueName" /> </a>
												<a href="<%=request.getContextPath()%>/sys/user_logout">&nbsp;退出 </a>
										</s:if>
										<s:else>
										<a href="<%=request.getContextPath()%>/user_login.jsp">登录</a>
										</s:else>
								</p>
						</div>
				</div>
		</div>
</div>

<header class="jumbotron subhead" id="overview">
		<div class="container">
				<p class="lead"><s:property value="%{@com.egovernment.util.PropertyUtil@get('app.name')}" /></p>
		</div>
</header>
