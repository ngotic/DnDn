package com.project.dndn.lunchdetail.domain;

import lombok.Data;

@Data
public class LunchBoxDTO {
	private String lunchboxseq;
	private String name;
	private String category;
	private int price;
	private String pic;
	private String regdate;
	private String modidate;
}
