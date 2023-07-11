package com.project.dndn.order.domain;

import lombok.Data;

@Data
public class OrderDTO {

	
	//회원정보
	private String id;
	private String name;
	private String pw;
	private String tel;
	private String birth;
	private String email;
	private String gender;
	private String address;
	private String addressdetail;
	private String regdate;
	private String enabled;
	
	// 회원 주문내역
	private String orderseq;  //주문 번호
	private String price; //금액
	private String orderdate; //주문 날짜
	private String request;//배송요청사항 
	private String couponseq; //쿠폰 번호
	private String cartseq; //장바구니번호
	private String payment; // 결제방식
	private String ispay; // 결제유무
	private String addressseq; // 배송주소번호
	private String content;

	
	// 정기배송
	private String periodshipseq;
	private int shipdate;
	private String shiptime;
	private String shipperiod;
	private String dayperweek;
	private String startship;
	private String endship;
	private String auth;

}
