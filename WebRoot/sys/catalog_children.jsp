<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<script type="text/javascript">
	$(function() {
		$(".add-catalog").click(function() {
			$(".form-edit-catalog").slideToggle("normal");
		});

		$(".select-all").click(function(event) {
			var state = event.currentTarget.checked;
			$("input:checkbox.check-catalog").each(function(i, el) {
				el.checked = state;
			});
		});

		$("button.catalog-delete").click(function(event) {
			if (confirm("确定要删除该栏目吗？")) {
				url = $(event.currentTarget).attr("href");
				document.location.href = url;
			}
		});
	});
</script>
<div class="catalog-content">
		<table class="table table-bordered table-hover">
				<thead>
						<tr class="error">
								<th>#</th>
								<th>栏目名</th>
								<th>父栏目</th>
								<th>状态</th>
								<th>级别</th>
								<th>简介</th>
								<th>链接</th>
								<th>操作</th>
						</tr>
				</thead>
				<tbody>
						<s:if test="#request.catalogList.size eq 0">
								<tr>
										<td></td>
										<td colspan="8"><p class="text-info">该栏目下目前没有子栏目。</p>
										</td>
								</tr>
						</s:if>
						<s:iterator value="#request.catalogList" var="sysCatalog" status="rowstatus">
								<s:if test="#rowstatus.even == true">
										<tr class=success>
								</s:if>
								<s:else>
										<tr class="info">
								</s:else>

								<td>
										<%-- <label class="checkbox"><input type="checkbox" class="check-catalog"
										value="<s:property value="sysCatalog.id" />" /></label> --%>
								</td>
								<td><s:property value="#sysCatalog.name" />
								</td>
								<td><s:property value="#sysCatalog.parentId" /> <%-- <s:iterator value="#application.catalogMap"
										var="map">
										<s:if test="#map.key != 1"></s:if>
								</s:iterator> --%>
								</td>
								<td><s:if test="#sysCatalog.status eq 0">正常</s:if> <s:elseif test="#sysCatalog.status eq 3">已关闭</s:elseif>
								<td><s:property value="#sysCatalog.level" />
								</td>
								<td><s:property value="#sysCatalog.content" />
								</td>
								<td><s:property value="#sysCatalog.url" />
								</td>
								<td><button
												href="<%=request.getContextPath()%>/sys/catalog_edit?catalogId=<s:property value='#sysCatalog.id' />"
												type="button" class="btn catalog-edit">编辑</button>
										<button
												href="<%=request.getContextPath()%>/sys/catalog_delete?catalogId=<s:property value='#sysCatalog.id' />"
												type="button" class="btn btn-danger catalog-delete">删除</button>
								</td>
								</tr>
						</s:iterator>
				</tbody>
		</table>

		<form class="form-inline form-edit-catalog hide" method="post" action="sys/catalog_add">
				<input style="display: none;" type="text" id="inputCatalog" placeholder="文章栏目"
						name="sysCatalog.parentId" /> <input name="sysCatalog.name" type="text" class="input-block-level"
						placeholder="栏目名" /> <span class="input-medium uneditable-input selected-catalog">点击左边选择父栏目</span> <input
						name="sysCatalog.content" type="text" class="input-block-level" placeholder="简介" /> <!-- <input
						name="sysCatalog.url" type="text" class="input-block-level" placeholder="栏目链接" /> -->
				<button type="submit" class="btn btn-primary submit-catalog">确定</button>
		</form>

		<form class="form-search">
				<label class="checkbox hide">全选<input type="checkbox" class="select-all" /> </label>
				<button type="button" class="add-catalog btn btn-primary">添加</button>
				<!-- <input type="text" class="input-medium search-query" placeholder="关键字">
				<button type="button" class="btn btn-primary">查询</button> -->
		</form>
</div>
