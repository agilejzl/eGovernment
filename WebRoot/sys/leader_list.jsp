<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<script type="text/javascript">
	$(function() {
		$(".select-all").click(function(event) {
			var state = event.currentTarget.checked;
			$("input:checkbox.check-leader").each(function(i, el) {
				el.checked = state;
			});
		});
		
		$("button.leader-delete").click(function(event) {
			if (confirm("确定要删除该领导吗？")) {
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
						<th>姓名</th>
						<th>职称</th>
						<th>信箱</th>
						<th>职位</th>
						<th>简介</th>
						<th>首页显示</th>
						<th>操作</th>
				</tr>
		</thead>
		<tbody>
				<s:iterator value="#request.leaderList" var="leader" status="rowstatus">
						<s:if test="#rowstatus.even == true">
								<tr class=success>
						</s:if>
						<s:else>
								<tr class="info">
						</s:else>

						<td><%-- <label class="checkbox"><input type="checkbox" class="check-leader"
										value="<s:property value="leader.id" />" /></label> --%>
						</td>
						<td><s:property value="#leader.name" />
						</td>
						<td><s:property value="#leader.duty" />
						</td>
						<td><s:property value="#leader.email" />
						</td>
						<td><s:property value="#leader.job" />
						</td>
						<td><s:property value="#leader.resume" />
						</td>
						<td><s:if test="#leader.isIndex eq 0">是</s:if><s:else>否</s:else>
						</td>
						<td><button
																href="<%=request.getContextPath()%>/sys/leader_edit?leaderId=<s:property value='#leader.id' />"
																type="button" class="btn leader-edit">编辑</button>
														<button
																href="<%=request.getContextPath()%>/sys/leader_delete?leaderId=<s:property value='#leader.id' />"
																type="button" class="btn btn-danger leader-delete">删除</button></td>
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