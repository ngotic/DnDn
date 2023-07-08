package com.project.dndn.main.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.project.dndn.main.mapper.LunchMapper;

import com.project.dndn.main.domain.LunchBoardDTO;

@Service
public class LunchBoxServiceImpl implements LunchBoxService{

	@Autowired
	private LunchMapper mapper; // 인텔리제이가 얘 인식을 못함..
	
	@Override
	public List<LunchBoardDTO> getRecentLunchServce() {
		return mapper.getRecentLunchBoard();
	}

	@Override
	public List<LunchBoardDTO> getHotLunchServce() {
		// TODO Auto-generated method stub
		return mapper.getHotLunchBoard();
	}

	@Override
	public List<LunchBoardDTO> getLunchBoardByCategory(String category) {
		return mapper.getLunchBoardByCategory(category);
	}
	
	
}
