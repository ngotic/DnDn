package com.project.dndn.lunchdetail.domain;

import lombok.Data;

import java.util.List;


// 제품 상세설명까지 모두 담아야 한다.
@Data
public class LunchBoxDTO {

	private String sellboardseq;
	private String content;
	private int sale;
	private String regdate;
	private String periodic;
	private String pic;
	private int price;

	// 제품 설명
	List<String> detailUrl; // 싹다 저장
}
