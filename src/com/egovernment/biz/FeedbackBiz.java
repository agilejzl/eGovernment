package com.egovernment.biz;

import java.util.List;

import com.egovernment.dto.PageParam;
import com.egovernment.entity.Feedback;

public interface FeedbackBiz {
	Feedback publishFeedback(Feedback feedback);

	List<Feedback> getFeedbacks(String hql, PageParam pageParam, Object... args);

	Long getFeedbackCount(String hql, Object... args);

	Feedback getFeedbackById(Long id);
}
