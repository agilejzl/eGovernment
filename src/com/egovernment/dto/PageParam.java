package com.egovernment.dto;

public class PageParam {
	private Integer pageNow = 1;
	private Long pageCount = 1L;
	private Long totalCount = 5L;
	private Integer pageSize = 5;

	public PageParam() {
	}

	public PageParam(Integer pageNow, Integer pageSize) {
		super();
		this.pageNow = pageNow;
		this.pageSize = pageSize;
	}

	public Integer getPageNow() {
		return pageNow;
	}

	public void setPageNow(Integer pageNow) {
		this.pageNow = pageNow;
	}

	public Long getPageCount() {
		pageCount = (totalCount % pageSize) == 0 ? (totalCount / pageSize)
				: (totalCount / pageSize + 1);
		return pageCount;
	}

	public void setPageCount(Long pageCount) {
		this.pageCount = pageCount;
	}

	public Long getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(Long totalCount) {
		this.totalCount = totalCount;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

}
