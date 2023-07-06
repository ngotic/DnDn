package com.project.dndn.mypage.domain;

import java.util.List;

import org.springframework.security.core.Authentication;

import lombok.Data;

@Data
public class MyPageDTO {

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
	private String point;
	
	
	//주문정보
	private String orderseq;
	private String orderdate;
	private String couponseq;
	
	//도시락 정보
	private String lunchname;
	private String lunchpic;
	private String lunchcategory;
	
	//장바구니 주문
	private String sellboardseq;
	private String cnt;
	private String storeseq;
	private String status;
	private String price;
	
	//정기배송
	private String periodshipseq;
	private String shipdate;
	private String shiptime;
	private String shipperiod;
	private String dayperweek;
	
	//쿠폰 정보
	private String sale;
	
	//찜 정보
	private String wishlistseq;
	private String wishid;
	private String wishregdate;
	
}
