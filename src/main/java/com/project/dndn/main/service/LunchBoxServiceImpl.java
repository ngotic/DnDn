package com.project.dndn.main.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.project.dndn.main.mapper.LunchMapper;

import com.project.dndn.main.domain.LunchBoardDTO;

@Service
public class LunchBoxServiceImpl implements LunchBoxService{

	@Autowired
	private LunchMapper mapper;
	
	@Override
	public List<LunchBoardDTO> getRecentLunchServce() {
		return mapper.getRecentLunchBoard();
	}
	
	
}
