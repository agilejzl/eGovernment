<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<script src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.form.js"></script>

<script type="text/javascript">
	$(function() {
		$(".pagination").find("[href]").click(
				function() {
					url = $(this).attr("href") + "&catalogId="
							+ $(".article-table").attr("catalogId");
					$(".article-list").load(url);
					return false;
				});

		var editor, html = '';

		function createEditor() {
			if (editor)
				return;
			// Create a new editor inside the <div id="editor">, setting its value to html
			var config = {};
			editor = CKEDITOR.appendTo('editor', config, html);
		}

		function removeEditor() {
			if (!editor)
				return;
			// Retrieve the editor contents. In an Ajax application, this data would be sent to the server or used in any other way.
			document.getElementById('editorcontents').innerHTML = html = editor
					.getData();
			document.getElementById('contents').style.display = '';
			editor.destroy();
			editor = null;
		}

		$(".add-article").click(function() {
			createEditor();
			//$(".catalog-tree").slideToggle();
			$(".article-content").slideToggle();
			$("#articleModal").slideToggle();
		});

		$(".add-article-cancel").click(function() {
			//$(".catalog-tree").slideToggle();
			$("#articleModal").slideToggle();
			$(".article-content").slideToggle();
			return false;
		});

		$(".select-all").click(function(event) {
			var state = event.currentTarget.checked;
			$("input:checkbox.check-article").each(function(i, el) {
				el.checked = state;
			});
		});

		/* $(".add-article-submit").click(function() {
			var content = $(window.frames[0].document).find("body").html();
			$("#inputContent").val(content);
			var options = {
				success : function(responseText, statusText, xhr, $form) {
				},
				error : function(xhr, ajaxOptions, thrownError) {
				},
				//target : '#msgdlg',
				//url: url               // override for form's 'action' attribute 
				type : "post", // 'get' or 'post', override for form's 'method' attribute 
				//dataType:  null    // 'xml', 'script', or 'json' (expected server response type) 
				clearForm : true, // clear all form fields after successful submit 
				resetForm : true
			// reset the form after successful submit 
			//timeout:   3000  // $.ajax 选项,例如超时
			};
			$(".article-form").ajaxSubmit(options);

			//$(".catalog-tree").slideToggle();
			$("#articleModal").slideToggle();
			$(".article-content").slideToggle();
			return false;
		}); */
		
		$("button.article-delete").click(function(event) {
			if (confirm("确定要删除该文章吗？")) {
				url = $(event.currentTarget).attr("href");
				document.location.href = url;
			}
		});
	});
</script>
<div class="article-content">
		<table class="table table-bordered table-hover article-table"
				catalogId='<s:property value="#request.catalogId" />'>
				<thead>
						<tr class="error">
								<th>#</th>
								<th>文章名</th>
								<th>所属栏目</th>
								<th>内容</th>
								<th>作者</th>
								<th>状态</th>
								<th>操作</th>
						</tr>
				</thead>
				<tbody>
						<s:if test="#request.articleList.size eq 0">
								<tr>
										<td></td>
										<td colspan="6"><p class="text-info">该栏目下目前没有任何文章。</p></td>
								</tr>
						</s:if>
						<s:iterator value="#request.articleList" var="article" status="rowstatus">
								<s:if test="#rowstatus.even == true">
										<tr class=success>
								</s:if>
								<s:else>
										<tr class="info">
								</s:else>

								<td><%-- <label class="checkbox"><input class="check-article" type="checkbox"
												value="<s:property value="#article.id" />" /></label> --%>
								</td>
								<td><s:property value="%{@com.egovernment.util.StrUtil@subStr(#article.title,16)}" />
								</td>
								<td><s:property value="#article.sysCatalog.name" />
								</td>
								<td><s:property value="%{@com.egovernment.util.StrUtil@subStr(#article.content,16)}" />
								</td>
								<td><s:property value="#article.createAuthor" />
								</td>
								<td><s:if test="#article.status eq 0">已发布</s:if> <s:elseif test="#article.status eq 1">等待审核</s:elseif>
										<s:elseif test="#article.status eq 2">未通过审核</s:elseif>
								<td><button
										href="<%=request.getContextPath()%>/sys/article_edit?articleId=<s:property value='#article.id' />"
										type="button" class="btn article-edit">编辑</button>
								<button
										href="<%=request.getContextPath()%>/sys/article_delete?articleId=<s:property value='#article.id' />"
										type="button" class="btn btn-danger article-delete">删除</button></td>
								</tr>
						</s:iterator>
				</tbody>
		</table>

		<s:if test="#request.pageParam.pageCount > 1">
				<div class="pagination pagination-large pagination-right">
						<ul>
								<li class="disabled"><a>第<s:property value="#request.pageParam.pageNow" />/<s:property
														value="#request.pageParam.pageCount" />页</a>
								</li>
								<li><a href="<%=request.getContextPath()%>/sys/article_list?pageNow=1">首页</a>
								</li>
								<s:if test='#request.pageParam.pageNow > 1'>
										<li><a
												href="<%=request.getContextPath()%>/sys/article_list?pageNow=<s:property
																value="#request.pageParam.pageNow-1" />">«</a>
										</li>
								</s:if>

								<s:iterator begin="#request.pageParam.pageNow-2" end="#request.pageParam.pageNow+3" var="page">
										<s:if test="#page > 0 && #page <= #request.pageParam.pageCount">
												<li><a
														href="<%=request.getContextPath()%>/sys/article_list?pageNow=<s:property
																value="#page" />"><s:property
																		value="#page" /> </a>
												</li>
										</s:if>
								</s:iterator>

								<s:if test='#request.pageParam.pageNow < #request.pageParam.pageCount'>
										<li><a
												href="<%=request.getContextPath()%>/sys/article_list?pageNow=<s:property
																value="#request.pageParam.pageNow+1" />">»</a>
										</li>
								</s:if>
								<li><a
										href="<%=request.getContextPath()%>/sys/article_list?pageNow=<s:property
																value="#request.pageParam.pageCount" />">末页</a>
								</li>
								<li class="disabled go"><a><input type="text" placeholder="跳转到第N页" />
												<button type="button" class="btn btn-primary">跳转</button> </a>
								</li>
						</ul>
				</div>
		</s:if>

		<form class="form-search">
				<label class="checkbox hide">全选<input type="checkbox" class="select-all" /> </label>
				<!-- <a href="#articleModal"
				role="button" class="btn btn-primary add-article" data-toggle="modal">发布</a> -->

				<button type="button" class="btn btn-primary add-article" value="Create Editor">发布文章</button>
				<!-- <button type="button" class="btn btn-danger del-article">删除文章</button> -->
				<input type="text" class="input-medium search-query" placeholder="关键字">
				<button type="button" class="btn btn-primary">查询</button>
		</form>
</div>

<div id="articleModal" style="display: none">
		<form class="form-horizontal article-form" method="post" action="sys/article_add">
				<input style="display: none;" type="text" id="inputCatalog" placeholder="文章栏目"
						name="article.sysCatalog.id" />
				<div class="control-group">
						<label class="control-label" for="inputCatalog">栏目：</label>
						<div class="controls">
								<span class="input-medium uneditable-input selected-catalog">点击左边选择栏目</span>
								<!-- <input type="text" id="inputCatalog" placeholder="点击左边选择栏目"/> -->
						</div>
				</div>
				<div class="row-fluid">
						<div class="control-group span5">
								<label class="control-label" for="inputTitle">标题：</label>
								<div class="controls">
										<input type="text" id="inputTitle" placeholder="文章标题" name="article.title">
								</div>
						</div>
						<div class="control-group span5">
								<label class="control-label" for="inputSubTitle">副标题：</label>
								<div class="controls">
										<input type="text" id="inputSubTitle" placeholder="文章副标题" name="article.subTitle">
								</div>
						</div>
				</div>
				<div class="control-group">
						<input style="display: none;" type="text" id="inputContent" name="article.content">
						<!-- This div will hold the editor. -->
						<div id="editor">&nbsp;</div>
						<div id="contents" style="display: none;">
								<p>Edited Contents:</p>
								<!-- This div will be used to display the editor contents. -->
								<div id="editorcontents"></div>
						</div>
				</div>

				<button class="btn add-article-cancel">取消</button>
				<button type="submit" class="btn btn-primary add-article-submit">发布</button>
		</form>
</div>
