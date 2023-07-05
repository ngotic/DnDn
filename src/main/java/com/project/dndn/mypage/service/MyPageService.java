package com.project.dndn.mypage.service;

import java.util.List;

import com.project.dndn.mypage.domain.MyPageDTO;

public interface MyPageService {

	List<MyPageDTO> list(String id);

	List<MyPageDTO> Flist(String id);

	List<MyPageDTO> Olist(String id);

	void add(MyPageDTO dto);

	List<MyPageDTO> wlist(String id);

}
