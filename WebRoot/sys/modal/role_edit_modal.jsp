<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<script type="text/javascript">
	$(function() {
		$(".select-status option").each(function(e, el) {
			if (el.value == "${request.sysRole.status}") {
				el.selected = true;
			}
		});

	});
</script>

<form method="post"
		action="<%=request.getContextPath()%>/sys/role_update?sysRole.id=<s:property value="#request.sysRole.id" />">
		<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h3 id="myModalLabel">编辑角色</h3>

		</div>
		<div class="modal-body">
				<%-- <div class="hide">
						<input name="sysRole.id" type="text" value="<s:property value="#request.sysRole.id" />" />
				</div> --%>
				<div class="row-fluid">
						<div class="control-group row-fluid span6">
								<label class="control-label row span3" for="inputName">角色名：</label>
								<div class="controls row span3">
										<input id="inputName" name="sysRole.name" type="text" class="input-block-level" placeholder="角色名"
												value="<s:property value="#request.sysRole.name" />" />
								</div>
						</div>
						<div class="control-group row-fluid span6">
								<label class="control-label row span3" for="inputStatus">状态：</label> <select class="select-status"
										name="sysRole.status">
										<option value="0">启用</option>
										<option value="3">关闭</option>
								</select>
						</div>
						<div class="row-fluid">
								<div class="control-group row-fluid span6">
										<label class="control-label row span3" for="inputDescription">描述：</label>
										<div class="controls row span3">
												<input id="inputDescription" name="sysRole.description" type="text" class="input-block-level"
														placeholder="角色描述" value="<s:property value="#request.sysRole.description" />" />
										</div>
								</div>

						</div>
						<div class="row-fluid">
								<div class="span12">
										<div class="control-group">
												模块权限：
												<%-- <s:iterator value="#request.sysRole.sysModules" var="sysMoudle">
														<s:property value="#sysMoudle.name" />
												</s:iterator> --%>
												<s:iterator value="#request.moduleList" var="sysMoudle">
														<label class="checkbox inline"> <input type="checkbox" name="moduleIdList"
																value="<s:property value="#sysMoudle.id" />"> <s:property value="#sysMoudle.name" />
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