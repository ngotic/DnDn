package com.project.dndn.mypage.mapper;

import java.util.List;

import com.project.dndn.mypage.domain.MyPageDTO;

public interface MyPageMapper {

	List<MyPageDTO> list(String id);

	void add(MyPageDTO dto);

	List<MyPageDTO> Flist(String id);

	List<MyPageDTO> Olist(String id);

}
