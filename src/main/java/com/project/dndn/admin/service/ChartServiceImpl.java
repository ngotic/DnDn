package com.project.dndn.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dndn.admin.domain.ChartDTO;
import com.project.dndn.admin.mapper.ChartMapper;

@Service
public class ChartServiceImpl implements ChartService {

	@Autowired
	private ChartMapper mapper;
	
	
	@Override
	public List<ChartDTO> countRegdate(ChartDTO dto) {
		
		return mapper.countRegdate();
	}
	
}
