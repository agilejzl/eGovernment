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
		$(".add-role").click(function() {
			$(".form-edit-role").slideToggle("normal");
		});

		var options = {
			success : function(responseText, statusText, xhr, $form) {
			},
			error : function(xhr, ajaxOptions, thrownError) {
			},
		//target : '#msgdlg',
		//url: url               // override for form's 'action' attribute 
		//type: "post"        // 'get' or 'post', override for form's 'method' attribute 
		//dataType:  null    // 'xml', 'script', or 'json' (expected server response type) 
		//clearForm: true   // clear all form fields after successful submit 
		//resetForm: true   // reset the form after successful submit 
		//timeout:   3000  // $.ajax 选项,例如超时
		};

		$(".select-all").click(function(event) {
			var state = event.currentTarget.checked;
			$("input:checkbox.check-role").each(function(i, el) {
				el.checked = state;
			});
		});

		/* $('.form-edit-role').submit(function() {
			$(this).ajaxSubmit(options);
			return false;
		}); */

		$("button.role-delete").click(function(event) {
			if (confirm("确定要删除该角色吗？")) {
				url = $(event.currentTarget).attr("href");
				document.location.href = url;
			}
		});

		$("button.role-edit").click(function(event) {
			url = $(event.currentTarget).attr("href");
			$("#roleEditModal").load(url);
			$("#roleEditModal").modal("show");
		});
	});
</script>

<jsp:include page="/sys/top.jsp"></jsp:include>

<div class="container">
		<div class="row">
				<div class="span12">
						<table class="table table-bordered table-hover">
								<thead>
										<tr>
												<th>#</th>
												<th>角色名</th>
												<th>模块权限</th>
												<th>角色说明</th>
												<th>状态</th>
												<th>操作</th>
										</tr>
								</thead>
								<tbody>
										<s:iterator value="#request.roleList" var="sysRole" status="rowstatus">
												<s:if test="#rowstatus.even == true">
														<tr class=success>
												</s:if>
												<s:else>
														<tr class="info">
												</s:else>
												<td>
														<!-- <label class="checkbox"><input type="checkbox" class="check-role"></label> --></td>
												<td><s:property value="#sysRole.name" /></td>
												<td><s:iterator value="#sysRole.sysModules" var="sysModule">
																<s:property value="#sysModule.name" />
														</s:iterator></td>
												<td><s:property value="#sysRole.description" /></td>
												<td><s:if test="#sysRole.status eq 0">正常</s:if> <s:elseif test="#sysRole.status eq 3">已禁用</s:elseif>
												</td>
												<td><button
																href="<%=request.getContextPath()%>/sys/role_edit?sysRoleId=<s:property value='#sysRole.id' />"
																type="button" class="btn role-edit">编辑</button>
														<button
																href="<%=request.getContextPath()%>/sys/role_delete?sysRoleId=<s:property value='#sysRole.id' />"
																type="button" class="btn btn-danger role-delete">删除</button>
												</td>
												</tr>
										</s:iterator>
								</tbody>
						</table>

						<div class="span12">
								<form class="form-inline form-edit-role hide" method="post" action="sys/role_add">
										<input name="sysRole.name" type="text" class="input-block-level" placeholder="角色名" /><input
												name="sysRole.description" type="text" class="input-block-level" placeholder="角色说明" /><!-- <input
												name="sysRole.status" type="text" class="input-block-level" placeholder="角色状态" /> -->
										<button type="submit" class="btn btn-primary submit-role">确定</button>
								</form>
						</div>

						<form class="form-search">
								<label class="checkbox hide">全选<input type="checkbox" class="select-all"> </label>
								<button type="button" class="add-role btn btn-primary">添加</button>
						</form>
				</div>
		</div>
</div>

<jsp:include page="/sys/buttom.jsp"></jsp:include>
<div id="roleEditModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
		aria-hidden="true"></div>