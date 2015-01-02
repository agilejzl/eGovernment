package com.egovernment.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;

import com.egovernment.biz.ArticleBiz;
import com.egovernment.biz.SysCatalogBiz;
import com.egovernment.dto.PageParam;
import com.egovernment.entity.Article;
import com.opensymphony.xwork2.ActionSupport;

public class IndexCl extends ActionSupport implements RequestAware {
	private SysCatalogBiz sysCatalogBiz;
	private ArticleBiz articleBiz;
	private Map<String, Object> request;

	public SysCatalogBiz getSysCatalogBiz() {
		return sysCatalogBiz;
	}

	public void setSysCatalogBiz(SysCatalogBiz sysCatalogBiz) {
		this.sysCatalogBiz = sysCatalogBiz;
	}

	public ArticleBiz getArticleBiz() {
		return articleBiz;
	}

	public void setArticleBiz(ArticleBiz articleBiz) {
		this.articleBiz = articleBiz;
	}

	public String index() {
		List<Article> articleList_dt = articleBiz.getArticles(
				"from Article where sysCatalog.name = '动态新闻'", new PageParam());
		request.put("articleList_dt", articleList_dt);
		List<Article> articleList_jj = articleBiz.getArticles(
				"from Article where sysCatalog.name = '经济状况'", new PageParam());
		request.put("articleList_jj", articleList_jj);
		// Article article_gg = articleBiz.getArticles(
				// "from Article where sysCatalog.name = '公告公示'",
				// new PageParam(1, 1)).get(0);
		// request.put("article_gg", article_gg);
		return SUCCESS;
	}

	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

}
