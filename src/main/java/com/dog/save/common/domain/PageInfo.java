package com.dog.save.common.domain;

import lombok.Data;

@Data
public class PageInfo {
	private int totalCount;
	private int currentPage;
	private int recordCountPerPage;
	private int naviCountPerPage;
	private int naviTotalCount;
	private int startNavi;
	private int endNavi;
	
	public PageInfo(int totalCount, int currentPage, int recordCountPerPage, int naviCountPerPage,
			int naviTotalCount, int startNavi, int endNavi) {
		super();
		this.totalCount = totalCount;
		this.currentPage = currentPage;
		this.recordCountPerPage = recordCountPerPage;
		this.naviCountPerPage = naviCountPerPage;
		this.naviTotalCount = naviTotalCount;
		this.startNavi = startNavi;
		this.endNavi = endNavi;
	}
}
