package com.project.dndn.mypage.mapper;

import java.util.List;
import java.util.Map;

import com.project.dndn.mypage.domain.MyPageDTO;

public interface MyPageMapper {

	List<MyPageDTO> list(String id);

	void add(MyPageDTO dto);

	List<MyPageDTO> Flist(String id);

	List<MyPageDTO> Olist(String id);

	List<MyPageDTO> wlist(String id);

	int wdlist(Map<String, String> map);

	int wIlist(Map<String, String> map);

	List<MyPageDTO> orderList(String id);

	List<MyPageDTO> listCart(String id);

}
