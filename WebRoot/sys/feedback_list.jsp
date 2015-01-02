<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<script type="text/javascript">
	$(function() {
		$(".select-all").click(function(event) {
			var state = event.currentTarget.checked;
			$("input:checkbox.check-feedback").each(function(i, el) {
				el.checked = state;
			});
		});
		
		$("button.feedback-delete").click(function(event) {
			if (confirm("确定要删除该反馈信息吗？")) {
				url = $(event.currentTarget).attr("href");
				document.location.href = url;
			}
		});
	});
</script>

<table class="table table-bordered table-hover">
		<thead>
				<tr class="error">
						<th>#</th>
						<th>标题</th>
						<th>反馈人</th>
						<th>反馈内容</th>
						<th>反馈时间</th>
						<th>处理过程</th>
						<th>状态</th>
						<th>操作</th>
				</tr>
		</thead>
		<tbody>
				<s:iterator value="#request.feedbackList" var="feedback" status="rowstatus">
						<s:if test="#rowstatus.even == true">
								<tr class=success>
						</s:if>
						<s:else>
								<tr class="info">
						</s:else>

						<td><%-- <label class="checkbox"><input type="checkbox" class="check-feedback"
										value="<s:property value="feedback.id" />" /> </label> --%></td>
						<td><s:property value="#feedback.title" /></td>
						<td><s:property value="#feedback.author" /></td>
						<td><s:property value="#feedback.content" /></td>
						<td><s:property value="#feedback.createTime" /></td>
						<td><s:property value="#feedback.dealProcess" /></td>
						<td><s:if test="#feedback.status eq 0">已处理</s:if>
						<s:elseif test="#feedback.status eq 1">等待处理</s:elseif>
						<s:elseif test="#feedback.status eq 2">已关闭</s:elseif>
						<s:elseif test="#feedback.status eq 3">失败</s:elseif>
						<td><button
																href="<%=request.getContextPath()%>/sys/feedback_edit?feedbackId=<s:property value='#feedback.id' />"
																type="button" class="btn feedback-edit">编辑</button>
														<button
																href="<%=request.getContextPath()%>/sys/feedback_delete?feedbackId=<s:property value='#feedback.id' />"
																type="button" class="btn btn-danger feedback-delete">删除</button></td>
						</tr>
				</s:iterator>
		</tbody>
</table>

<form class="form-search">
		<label class="checkbox hide">全选<input type="checkbox" class="select-all" /> </label>
		<button type="button" class="add-catalog btn btn-primary">添加</button>
		<input type="text" class="input-medium search-query" placeholder="关键字">
		<button type="button" class="btn btn-primary">查询</button>
</form>