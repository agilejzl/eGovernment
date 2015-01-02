package com.egovernment.action;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;

import com.egovernment.biz.ArticleBiz;
import com.egovernment.dto.PageParam;
import com.egovernment.dto.Status;
import com.egovernment.entity.Article;
import com.egovernment.entity.SysUser;
import com.egovernment.util.WebUtil;
import com.opensymphony.xwork2.ActionSupport;

public class ArticleCl extends ActionSupport implements RequestAware {
	private ArticleBiz articleBiz;
	private Long catalogId;
	private Long articleId;
	private Map<String, Object> request;
	private Integer pageNow;
	private Integer pageSize;
	private Article article;

	public Long getArticleId() {
		return articleId;
	}

	public void setArticleId(Long articleId) {
		this.articleId = articleId;
	}

	public Article getArticle() {
		return article;
	}

	public void setArticle(Article article) {
		this.article = article;
	}

	public Integer getPageNow() {
		return pageNow;
	}

	public void setPageNow(Integer pageNow) {
		this.pageNow = pageNow;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Long getCatalogId() {
		return catalogId;
	}

	public void setCatalogId(Long catalogId) {
		this.catalogId = catalogId;
	}

	public ArticleBiz getArticleBiz() {
		return articleBiz;
	}

	public void setArticleBiz(ArticleBiz articleBiz) {
		this.articleBiz = articleBiz;
	}

	public String articleGet() {
		Article article = articleBiz.findOne("from Article where id = ?", articleId);
		request.put("article", article);
		return SUCCESS;
	}

	public String articleAdd() {
		HttpServletRequest request = ServletActionContext.getRequest();
		SysUser user = (SysUser) request.getSession().getAttribute(
				SysUserCl.CURR_USER);
		article.setHits(0);
		article.setCreateTime(new Date());
		article.setCreateIp(WebUtil.getIpAddr(request));
		article.setCreateAuthor(user.getName());
		article.setStatus(Status.WAIT);
		article = articleBiz.publishArticle(article);
		if (article != null) {
			return SUCCESS;
		}
		return INPUT;
	}

	public String articleDelete() {
		articleBiz.delete(articleBiz.findOne("from Article where id =?",
				articleId));
		return SUCCESS;
	}

	public String articleList() {
		Long totalCount = articleBiz
				.getArticleCount("select count(*) from Article where sysCatalog.id="
						+ catalogId);
		PageParam pageParam = new PageParam();
		pageParam.setTotalCount(totalCount);

		if (pageNow != null && pageNow > 0
				&& pageNow <= pageParam.getPageCount()) {
			pageParam.setPageNow(pageNow);
		} else {
			pageParam.setPageNow(1);
		}
		if (pageSize != null && pageSize > 0 && pageSize <= 20) {
			pageParam.setPageSize(pageSize);
		} else {
			pageParam.setPageSize(5);
		}

		List<Article> articleList = articleBiz.getArticles(
				"from Article where sysCatalog.id = " + catalogId, pageParam);
		request.put("pageParam", pageParam);
		request.put("articleList", articleList);
		request.put("catalogId", catalogId);
		return SUCCESS;
	}

	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
}
