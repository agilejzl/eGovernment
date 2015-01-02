<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		<h3 id="myModalLabel">用户信息</h3>
</div>
<div class="modal-body">
		<div class="row-fluid">
				<div class="span6">
						<div class="control-group">
								用户名：
								<s:property value="#request.sysUser.name" />
						</div>
				</div>
				<div class="span6">
						<div class="control-group">
								姓名：
								<s:property value="#request.sysUser.trueName" />
						</div>
				</div>
		</div>
		<div class="row-fluid">
				<div class="row-fluid">
						<div class="span6">
								<div class="control-group">
										描述：
										<s:property value="#request.sysUser.description" />
								</div>
						</div>
						<div class="span6">
								<div class="control-group">
										状态：
										<s:if test="#request.sysUser.status eq 0">正常</s:if>
										<s:elseif test="#request.sysUser.status eq 1">等待审核</s:elseif>
										<s:elseif test="#request.sysUser.status eq 2">未通过审核</s:elseif>
										<s:elseif test="#request.sysUser.status eq 3">关闭</s:elseif>
								</div>
						</div>
				</div>
		</div>
		<div class="row-fluid">
				<div class="span6">
						<div class="control-group">
								用户角色：
								<s:iterator value="#request.sysUser.sysRoles" var="sysRole">
										<s:property value="#sysRole.name" />
								</s:iterator>
						</div>
				</div>
				<div class="span6">
						<div class="control-group"></div>
				</div>
		</div>
</div>
<div class="modal-footer">
		<button class="btn btn-primary" data-dismiss="modal" aria-hidden="true">确定</button>
</div>