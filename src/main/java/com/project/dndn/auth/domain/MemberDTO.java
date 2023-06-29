package com.project.dndn.auth.domain;

import java.util.List;

import lombok.Data;

@Data
public class MemberDTO {
	private String id;
	private String pw;
	private String name;
	private String tel;
	private String email; 
	private String gender;
	private String address;
	private String addressD;
	private String regdate;
	private String enabled;
	private String point;
	private List<AuthDTO> authlist;
}
