<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<script src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.js"></script>

<div class="article-content">
		<table class="table table-hover article-table" catalogId='<s:property value="#request.catalogId" />'>
				<tbody>
						<s:iterator value="#request.articleList" var="article" status="rowstatus">
								<s:if test="#rowstatus.even == true">
										<tr class=success>
								</s:if>
								<s:else>
										<tr class="info">
								</s:else>
								<td><a href='view/article_get?articleId=<s:property
																		value="#article.id" />'><s:property
														value="%{@com.egovernment.util.StrUtil@subStr(#article.title,24)}" /> </a></td>
								<td><s:property value="#article.sysCatalog.name" /></td>
								<td><s:property value="%{@com.egovernment.util.StrUtil@subStr(#article.content,16)}" /></td>
								<td><s:property value="#article.author" /></td>
								<td><s:property value="#article.status" /></td>
								</tr>
						</s:iterator>
				</tbody>
		</table>
		<s:if test="#request.pageParam.pageCount > 1">
				<div class="pagination pagination-large pagination-right">
						<ul>
								<li class="disabled"><a>第<s:property value="#request.pageParam.pageNow" />/<s:property
														value="#request.pageParam.pageCount" />页</a></li>
								<li><a href="<%=request.getContextPath()%>/view/list_article?pageNow=1">首页</a></li>
								<s:if test='#request.pageParam.pageNow > 1'>
										<li><a
												href="<%=request.getContextPath()%>/view/list_article?pageNow=<s:property
																value="#request.pageParam.pageNow-1" />">«</a>
										</li>
								</s:if>

								<s:iterator begin="#request.pageParam.pageNow-2" end="#request.pageParam.pageNow+3" var="page">
										<s:if test="#page > 0 && #page <= #request.pageParam.pageCount">
												<li><a
														href="<%=request.getContextPath()%>/view/list_article?pageNow=<s:property
																value="#page" />"><s:property
																		value="#page" /> </a></li>
										</s:if>
								</s:iterator>

								<s:if test='#request.pageParam.pageNow < #request.pageParam.pageCount'>
										<li><a
												href="<%=request.getContextPath()%>/view/list_article?pageNow=<s:property
																value="#request.pageParam.pageNow+1" />">»</a>
										</li>
								</s:if>
								<li><a
										href="<%=request.getContextPath()%>/view/list_article?pageNow=<s:property
																value="#request.pageParam.pageCount" />">末页</a>
								</li>
								<li class="disabled go"><a><input type="text" placeholder="跳转到第N页" />
												<button type="button" class="btn btn-primary">跳转</button> </a></li>
						</ul>
				</div>
		</s:if>
		<s:if test="#request.pageParam.totalCount == 0">
				<p class="text-info">该栏目下目前没有任何文章。</p>
		</s:if>
</div>
