package com.project.dndn.order.domain;

import java.util.Date;

import lombok.Data;

@Data
public class OrderCouponDTO {

	private String couponseq;
	private String name;
	private int sale;
	private String period;
	private int period2;
	
}
