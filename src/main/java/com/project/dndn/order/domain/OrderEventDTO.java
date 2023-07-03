package com.project.dndn.order.domain;


import java.sql.Date;

import lombok.Data;

@Data
public class OrderEventDTO {

	private String eventseq;
	private String title;
	private String regdate;
	private String startdate;
	private String enddate;
	private int sale;
	private String pic;
	private String pic_board;
	private int count;
	private int rownum;
	private boolean edit;
}
