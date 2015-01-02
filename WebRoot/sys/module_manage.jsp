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

<script type="text/javascript">
	$(function() {
		$(".add-module").click(function() {
			$(".form-edit-module").slideToggle("normal");
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
			$("input:checkbox.check-moudle").each(function(i, el) {
				el.checked = state;
			});
		});

		/* $('.form-edit-module').submit(function() {
			$(this).ajaxSubmit(options);
			return false;
		}); */
		
		$("button.module-delete").click(function(event) {
			if (confirm("确定要删除该模块吗？")) {
				url = $(event.currentTarget).attr("href");
				document.location.href = url;
			}
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
												<th>模块名</th>
												<th>模块链接</th>
												<th>模块说明</th>
												<th>状态</th>
												<th>操作</th>
										</tr>
								</thead>
								<tbody>
										<s:iterator value="#request.moduleList" var="sysModule" status="rowstatus">
												<s:if test="#rowstatus.even == true">
														<tr class=success>
												</s:if>
												<s:else>
														<tr class="info">
												</s:else>
												<td><!-- <label class="checkbox"><input class="check-moudle" type="checkbox"></label> -->
												</td>
												<td><s:property value="#sysModule.name" />
												</td>
												<td><s:property value="#sysModule.link" />
												</td>
												<td><s:property value="#sysModule.description" />
												</td>
												<td><s:if test="#sysModule.status eq 0">正常</s:if> <s:elseif test="#sysModule.status eq 3">已关闭</s:elseif>
												</td>
												<td><button
																href="<%=request.getContextPath()%>/sys/module_edit?sysModuleId=<s:property value='#sysModule.id' />"
																type="button" class="btn module-edit">编辑</button>
														<button
																href="<%=request.getContextPath()%>/sys/module_delete?sysModuleId=<s:property value='#sysModule.id' />"
																type="button" class="btn btn-danger module-delete">删除</button></td>
												</tr>
										</s:iterator>
								</tbody>
						</table>

						<div class="span12">
								<form class="form-inline form-edit-module hide" method="post" action="sys/module_add">
										<input name="sysModule.name" type="text" class="input-block-level" placeholder="模块名" /><input
												name="sysModule.link" type="text" class="input-block-level" placeholder="模块链接" /> <input
												name="sysModule.description" type="text" class="input-block-level" placeholder="系统模块说明" /><input
												name="sysModule.status" type="text" class="input-block-level hide" placeholder="模块状态" />
										<button type="submit" class="btn btn-primary submit-module">确定</button>
								</form>
						</div>

						<form class="form-search">
								<label class="checkbox hide">全选<input type="checkbox" class="select-all"> </label>
								<button type="button" class="add-module btn btn-primary">添加</button>
						</form>

				</div>
		</div>
</div>
<jsp:include page="/sys/buttom.jsp"></jsp:include>