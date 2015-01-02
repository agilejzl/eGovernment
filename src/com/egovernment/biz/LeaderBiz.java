package com.egovernment.biz;

import java.util.List;

import com.egovernment.entity.Leader;
import com.egovernment.entity.LeaderSort;

public interface LeaderBiz {
	List<LeaderSort> getLeaderSortList(String hql, Object... args);

	List<Leader> getLeaders(String hql, Object... args);
}
