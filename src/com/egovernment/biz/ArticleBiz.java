package com.egovernment.biz;

import java.util.List;

import com.egovernment.dto.PageParam;
import com.egovernment.entity.Article;
import com.egovernment.entity.SysModule;

public interface ArticleBiz {
	Article publishArticle(Article article);

	void delete(Article article);

	Article findOne(String hql, Object... args);

	List<Article> getArticles(String hql, PageParam pageParam, Object... args);

	Long getArticleCount(String hql, Object... args);

}
