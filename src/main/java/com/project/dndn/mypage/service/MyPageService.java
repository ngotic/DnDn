package com.project.dndn.mypage.service;

import java.util.List;

import com.project.dndn.mypage.domain.MyPageDTO;

public interface MyPageService {

	List<MyPageDTO> list(String id);

	void add(MyPageDTO dto);

}
