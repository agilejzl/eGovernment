package com.egovernment.biz.impl;

import java.util.List;

import com.egovernment.biz.ArticleBiz;
import com.egovernment.dao.ArticleDao;
import com.egovernment.dto.PageParam;
import com.egovernment.entity.Article;
import com.egovernment.entity.SysModule;

public class ArticleBizImpl implements ArticleBiz {
	private ArticleDao articleDao;

	public void setArticleDao(ArticleDao articleDao) {
		this.articleDao = articleDao;
	}

	public Article publishArticle(Article article) {
		return (Article) articleDao.save(article);
	}

	public void delete(Article article) {
		articleDao.delete(article);
	}

	public Article findOne(String hql, Object... args) {
		return (Article) articleDao.uniqueResult(hql, args);
	}

	public List<Article> getArticles(String hql, PageParam pageParam,
			Object... args) {
		Integer offset = (int) ((pageParam.getPageNow() - 1) * pageParam
				.getPageSize());
		Integer pageSize = pageParam.getPageSize();
		return articleDao.getListByPage(Article.class, hql, offset, pageSize,
				args);
	}

	public Long getArticleCount(String hql, Object... args) {
		return (Long) articleDao.uniqueResult(hql, args);
	}

}
