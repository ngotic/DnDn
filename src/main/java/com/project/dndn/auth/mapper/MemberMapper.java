package com.project.dndn.auth.mapper;

import com.project.dndn.auth.domain.AuthDTO;
import com.project.dndn.auth.domain.MemberDTO;

public interface MemberMapper {

	MemberDTO read(String id);

	int register(MemberDTO dto);

	void registerAuth(AuthDTO adto);

	String findId(MemberDTO vo);

	String findPw(MemberDTO vo);

	int updatepw(MemberDTO vo);

	String idvalidcheck(MemberDTO dto);

	String emailvalidcheck(MemberDTO dto);



}
