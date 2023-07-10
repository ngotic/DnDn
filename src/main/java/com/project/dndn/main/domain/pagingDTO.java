package com.project.dndn.main.domain;

import lombok.Data;

@Data
public class pagingDTO {
	private String category;
	private String sort;
	private String page;
	
	private int begin;
	private int end;
	
	
	private int beginPage;
	private int endPage;
	
	private int totalCnt;
	private int pageSize = 9;
	private int totalPage;
	
	private int naviSize = 10;
	
	private boolean showPrev;
	private boolean showNext;
	
	
	
	
	public String getQueryStringByPage(String page) {
		return "category="+category+"&sort="+sort+"&page="+page;
	}
	
	public String getQueryStringBySort(String sort) {
		return "category="+category+"&sort="+sort+"&page="+page;
	}
	
	public String getQueryStringBySort(String sort, String page) {
		return "category="+category+"&sort="+sort+"&page="+page;
	}
	
	public String getQueryStringByCategory(String category) {
		return "category="+category+"&sort="+sort+"&page="+page;
	}
	
}
