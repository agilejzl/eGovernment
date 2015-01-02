<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<title><s:property value="%{@com.egovernment.util.PropertyUtil@get('app.name')}" />
</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
		href="<%=request.getContextPath()%>/bootstrap/css/bootstrap-responsive.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/docs.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/prettify.css">

<script src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/js/application.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.form.js"></script>

<script type="text/javascript">
	$(function() {
		$(".add-user").click(function() {
			$(".form-edit-user").slideToggle("normal");
		});
		
		function goPage(page){
		var url = "<%=request.getContextPath()%>/sys/user_list";
			if (page != null) {
				url += "?pageNow=" + page;
			}
			document.location.href = url;
		}

		$(".select-all").click(function(event) {
			var state = event.currentTarget.checked;
			$("input:checkbox.check-user").each(function(i, el) {
				el.checked = state;
			});
		});

		$(".go button").click(function() {
			var page = $(".go input").val();
			if (page < 1) {
				page = 1;
			}
			goPage(page);
		});

		$("button.user-delete").click(function(event) {
			if (confirm("确定要删除该用户吗？")) {
				url = $(event.currentTarget).attr("href");
				document.location.href = url;
			}
		});

		$("button.user-view").click(function(event) {
			url = $(event.currentTarget).attr("href");
			$("#userViewModal").load(url);
			$("#userViewModal").modal("show");
		});

		$("button.user-edit").click(function(event) {
			url = $(event.currentTarget).attr("href");
			$("#userEditModal").load(url);
			$("#userEditModal").modal("show");
		});

		/* $("#userEditModal").on("shown",function(event){
				$(".select-status option").each(function(e,el){
						debugger
						if(el.value == 1){
								el.selected = true;
						}
				});
		}); */
	});
</script>
<jsp:include page="/sys/top.jsp"></jsp:include>

<div class="container">
		<div class="row">
				<div class="span12">
						<table class="table table-bordered table-hover user-list">
								<thead>
										<tr class="error">
												<th>#</th>
												<th>用户名</th>
												<th>真实姓名</th>
												<th>个人描述</th>
												<th>用户角色</th>
												<th>状态</th>
												<th>操作用户</th>
										</tr>
								</thead>
								<tbody>
										<s:iterator value="#request.userList" var="sysUser" status="rowstatus">
												<s:if test="#rowstatus.even == true">
														<tr class=success>
												</s:if>
												<s:else>
														<tr class="info">
												</s:else>

												<td>
														<%-- <label class="checkbox"><input class="check-user" type="checkbox"
																value="<s:property value="#sysUser.id" />" /> </label> --%>
												</td>
												<td><s:property value="#sysUser.name" />
												</td>
												<td><s:property value="#sysUser.trueName" />
												</td>
												<td><s:property value="#sysUser.description" />
												</td>
												<td><s:iterator value="#sysUser.sysRoles" var="sysRole">
																<s:property value="#sysRole.name" />
														</s:iterator></td>
												<td><s:if test="#sysUser.status eq 0">正常</s:if> <s:elseif test="#sysUser.status eq 1">等待审核</s:elseif>
														<s:elseif test="#sysUser.status eq 2">未通过审核</s:elseif> <s:elseif test="#sysUser.status eq 3">关闭</s:elseif>
												</td>
												<td><button
																href="<%=request.getContextPath()%>/sys/user_view?sysUserId=<s:property value='#sysUser.id' />"
																type="button" class="btn user-view">查看</button>
														<button
																href="<%=request.getContextPath()%>/sys/user_edit?sysUserId=<s:property value='#sysUser.id' />"
																type="button" class="btn user-edit">编辑</button>
														<button
																href="<%=request.getContextPath()%>/sys/user_delete?sysUserId=<s:property value='#sysUser.id' />"
																type="button" class="btn btn-danger user-delete">删除</button>
												</td>
												</tr>
										</s:iterator>
								</tbody>
						</table>

						<div class="span12">
								<form class="form-inline form-edit-user hide" method="post" action="sys/user_add">
										<input name="sysUser.name" type="text" class="input-block-level" placeholder="用户名" /> <input
												name="sysUser.pass" type="text" class="input-block-level" placeholder="密码" /> <input
												name="sysUser.trueName" type="text" class="input-block-level" placeholder="真实姓名" /> <input
												name="sysUser.description" type="text" class="input-block-level" placeholder="个人描述" /><input
												name="sysUser.status" type="text" class="input-block-level hide" placeholder="用户状态" />
										<button type="submit" class="btn btn-primary submit-user">确定</button>
								</form>
						</div>

						<div class="pagination pagination-large pagination-right">
								<ul>
										<li class="disabled"><a>第<s:property value="#request.pageParam.pageNow" />/<s:property
																value="#request.pageParam.pageCount" />页</a>
										</li>
										<li><a href="<%=request.getContextPath()%>/sys/user_list?pageNow=1">首页</a>
										</li>
										<s:if test='#request.pageParam.pageNow > 1'>
												<li><a
														href="<%=request.getContextPath()%>/sys/user_list?pageNow=<s:property
																value="#request.pageParam.pageNow-1" />">«</a>
												</li>
										</s:if>

										<s:iterator begin="#request.pageParam.pageNow-2" end="#request.pageParam.pageNow+3" var="page">
												<s:if test="#page > 0 && #page <= #request.pageParam.pageCount">
														<li><a
																href="<%=request.getContextPath()%>/sys/user_list?pageNow=<s:property
																value="#page" />"><s:property
																				value="#page" /> </a>
														</li>
												</s:if>
										</s:iterator>

										<s:if test='#request.pageParam.pageNow < #request.pageParam.pageCount'>
												<li><a
														href="<%=request.getContextPath()%>/sys/user_list?pageNow=<s:property
																value="#request.pageParam.pageNow+1" />">»</a>
												</li>
										</s:if>
										<li><a
												href="<%=request.getContextPath()%>/sys/user_list?pageNow=<s:property
																value="#request.pageParam.pageCount" />">末页</a>
										</li>
										<li class="disabled go"><a><input type="text" placeholder="跳转到第N页" />
														<button type="button" class="btn btn-primary">跳转</button> </a>
										</li>
								</ul>
						</div>

						<form class="form-search">
								<label class="checkbox hide">全选<input type="checkbox" class="select-all" /> </label>
								<button type="button" class="add-user btn btn-primary">添加</button>
								<!-- <button type="button" class="btn btn-danger del-user">删除</button> -->
								<input type="text" class="input-medium search-query" placeholder="关键字"> 
								<button type="button" class="btn btn-primary">查询</button>
						</form>
				</div>

		</div>
</div>
<jsp:include page="/sys/buttom.jsp"></jsp:include>

<div id="userViewModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
		aria-hidden="true"></div>
<div id="userEditModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
		aria-hidden="true"></div>