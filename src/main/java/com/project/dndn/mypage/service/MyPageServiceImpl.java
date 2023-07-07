package com.project.dndn.mypage.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dndn.mypage.domain.MyPageDTO;
import com.project.dndn.mypage.mapper.MyPageMapper;

@Service("myService")
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	private MyPageMapper myMapper;

	@Override
	public List<MyPageDTO> list(String id) {
		return myMapper.list(id);
	}

	@Override
	public List<MyPageDTO> Flist(String id) {

		return myMapper.Flist(id);
	}

	@Override
	public List<MyPageDTO> Olist(String id) {

		return myMapper.Olist(id);
	}

	@Override
	public void add(MyPageDTO dto) {

		myMapper.add(dto);
	}

	@Override
	public List<MyPageDTO> wlist(String id) {
		
		return myMapper.wlist(id);
	}

	@Override
	public int wdlist(Map<String, String> map) {

		System.out.println(map.get("num"));
		if(map.get("num").equals("1")) {
			
			return myMapper.wdlist(map);
		}else {
			
			return myMapper.wIlist(map);
		}
	}

	@Override
	public List<MyPageDTO> orderList(String id) {
		return myMapper.orderList(id);
	}
}
