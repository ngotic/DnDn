package com.project.dndn.inform.domain;

import lombok.Data;

@Data
public class PageDTO {

	private int pageNo; //현재 페이지
	private int pageSize; //한화면에 보이는 글 개수//10
	private int totalCount; //전체 글 개수
	
	private int startNo; //현재 페이지 글 목록 시작 번호
	private int endNo; //현재 페이지 마지막 번호
	private int startPage; //페이지 이동 버튼 시작번호 
	private int endPage;//페이지 이동 버튼 마지막번호 
	private int totalPage;
	
	public PageDTO(int pageNo, int pageSize, int totalCount) {
		//this.pageNo = pageNo;
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		
	//계산 시작 : 페이지 개수
	totalPage = (totalCount - 1)/pageSize + 1;
	
	//*pageNo는 현재 페이지가 잘못된 값이 전달되었을 때 : 1보다 작은 값 또는 totalPage보다 큰 값
	this.pageNo = (pageNo < 1) ? 1 : pageNo;
	this.pageNo = (pageNo > totalPage) ? totalPage: pageNo;
	
	startNo = (this.pageNo-1)*pageSize + 1;
	endNo = startNo + (pageSize - 1);
	
	this.endNo = this.endNo > totalCount ? totalCount : this.endNo;
	
	startPage = (this.pageNo - 1) / 10*10+1; 
	
	endPage = startPage + 9;
	
	this.endPage = this.endPage > totalPage ? totalPage : this.endPage;
		
	}
	
	
	
}
