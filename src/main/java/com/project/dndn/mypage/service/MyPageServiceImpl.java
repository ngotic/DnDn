package com.project.dndn.mypage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dndn.mypage.domain.MyPageDTO;
import com.project.dndn.mypage.mapper.MyPageMapper;

@Service("myService")
public class MyPageServiceImpl implements MyPageService{

	@Autowired
	private MyPageMapper myMapper;

	@Override
	public List<MyPageDTO> list(String id) {
		return myMapper.list(id);
	}

	@Override
	public void add(MyPageDTO dto) {

		myMapper.add(dto);
	}
}
