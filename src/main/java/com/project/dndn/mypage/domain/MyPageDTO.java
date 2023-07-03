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
}
