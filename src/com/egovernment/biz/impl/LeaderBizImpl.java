package com.egovernment.biz.impl;

import java.util.List;

import com.egovernment.biz.LeaderBiz;
import com.egovernment.dao.LeaderDao;
import com.egovernment.entity.Leader;
import com.egovernment.entity.LeaderSort;

public class LeaderBizImpl implements LeaderBiz {
	private LeaderDao leaderDao;

	public void setLeaderDao(LeaderDao leaderDao) {
		this.leaderDao = leaderDao;
	}

	public List<LeaderSort> getLeaderSortList(String hql, Object... args) {
		return leaderDao.getList(LeaderSort.class, hql, args);
	}

	public List<Leader> getLeaders(String hql, Object... args) {
		return leaderDao.getList(Leader.class, hql, args);
	}

}
