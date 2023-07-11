package com.project.dndn.admin.domain;

import lombok.Data;

@Data
public class AdminOrderDTO {
	private String orderseq;
	private String id;
	private String price;
	private String orderdate;
	private String state;
	private String payment;
}
