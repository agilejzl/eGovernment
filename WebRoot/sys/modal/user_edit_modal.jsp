<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<script type="text/javascript">
	$(function() {
		$(".select-status option").each(function(e, el) {
			if (el.value == "${request.sysUser.status}") {
				el.selected = true;
			}
		});
	});
</script>

<form method="post"
		action="<%=request.getContextPath()%>/sys/user_update?sysUser.id=<s:property value="#request.sysUser.id" />">
		<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h3 id="myModalLabel">编辑用户</h3>

		</div>
		<div class="modal-body">
				<%-- <div class="hide">
						<input name="sysUser.id" type="text" value="<s:property value="#request.sysUser.id" />" />
				</div> --%>
				<div class="row-fluid">
						<div class="control-group row-fluid span6">
								<label class="control-label row span3" for="inputName">用户名：</label>
								<div class="controls row span3">
										<input id="inputName" name="sysUser.name" type="text" class="input-block-level" placeholder="用户名"
												value="<s:property value="#request.sysUser.name" />" />
								</div>
						</div>
						<div class="control-group row-fluid span6">
								<label class="control-label row span3" for="inputTrueName">姓名：</label>
								<div class="controls row span3">
										<input id="inputTrueName" name="sysUser.trueName" type="text" class="input-block-level"
												placeholder="真实姓名" value="<s:property value="#request.sysUser.trueName" />" />
								</div>
						</div>
						<div class="row-fluid">
								<div class="control-group row-fluid span6">
										<label class="control-label row span3" for="inputDescription">描述：</label>
										<div class="controls row span3">
												<input id="inputDescription" name="sysUser.description" type="text" class="input-block-level"
														placeholder="个人描述" value="<s:property value="#request.sysUser.description" />" />
										</div>
								</div>
								<div class="control-group row-fluid span6">
										<label class="control-label row span3" for="inputStatus">状态：</label> <select class="select-status"
												name="sysUser.status">
												<option value="">----</option>
												<option value="0">正常</option>
												<option value="1">等待审核</option>
												<option value="2">未通过审核</option>
												<option value="3">关闭</option>
										</select>
								</div>
						</div>
						<div class="row-fluid">
								<div class="span12">
										<div class="control-group">
												用户角色：
												<%-- <s:iterator value="#request.sysUser.sysRoles" var="sysRole">
														<s:property value="#sysRole.name" />
												</s:iterator> --%>
												<s:iterator value="#request.roleList" var="sysRole">
														<label class="checkbox inline"> <input type="checkbox" name="roleIdList"
																value="<s:property value="#sysRole.id" />"> <s:property value="#sysRole.name" />
														</label>
												</s:iterator>
										</div>
								</div>
						</div>
				</div>
		</div>
		<div class="modal-footer">
				<button class="btn cancel" data-dismiss="modal" aria-hidden="true">取消</button>
				<button type="submit" class="btn btn-primary">确定</button>
		</div>
</form>