package com.egovernment.biz.impl;

import java.util.List;

import com.egovernment.biz.FeedbackBiz;
import com.egovernment.dao.FeedbackDao;
import com.egovernment.dto.PageParam;
import com.egovernment.entity.Feedback;

public class FeedbackBizImpl implements FeedbackBiz {
	private FeedbackDao feedbackDao;

	public void setFeedbackDao(FeedbackDao feedbackDao) {
		this.feedbackDao = feedbackDao;
	}

	public Feedback publishFeedback(Feedback feedback) {
		return (Feedback) feedbackDao.save(feedback);
	}

	public List<Feedback> getFeedbacks(String hql, PageParam pageParam,
			Object... args) {
		Integer offset = (int) ((pageParam.getPageNow() - 1) * pageParam
				.getPageSize());
		Integer pageSize = pageParam.getPageSize();
		return feedbackDao.getListByPage(Feedback.class, hql, offset, pageSize,
				args);
	}

	public Long getFeedbackCount(String hql, Object... args) {
		return (Long) feedbackDao.uniqueResult(hql, args);
	}

	public Feedback getFeedbackById(Long id) {
		return feedbackDao.getById(Feedback.class, id);
	}

}
