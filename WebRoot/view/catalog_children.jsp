<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript">
	function selectChildren(id) {
		url = "view/list_article?catalogId=" + id;
		$(".article-list").load(url);
		return false;
	}
</script>

<table class="table table-hover">
		<tbody>
				<s:iterator value="#request.catalogList" var="sysCatalog" status="rowstatus">
						<s:if test="#rowstatus.even == true">
								<tr class=success>
						</s:if>
						<s:else>
								<tr class="info">
						</s:else>
						<td><a href="javascript:selectChildren(<s:property value="#sysCatalog.id" />);void(0);"'><s:property
												value="#sysCatalog.name" /> </a>
						</td>
						<td><s:property value="#sysCatalog.parentId" />
						</td>
						<td><s:property value="#sysCatalog.status" />
						</td>
						<td><s:property value="#sysCatalog.level" />
						</td>
						<td><s:property value="#sysCatalog.content" />
						</td>
						<td><s:property value="#sysCatalog.url" />
						</td>
						</tr>
				</s:iterator>
		</tbody>
</table>
