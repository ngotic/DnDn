package com.project.dndn.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dndn.admin.domain.AdminStoreDTO;
import com.project.dndn.admin.mapper.AdminStoreMapper;

@Service
public class AdminStoreServiceImpl implements AdminStoreService {
	
	@Autowired
	private AdminStoreMapper mapper;
	
	@Override
	public List<AdminStoreDTO> storelist() {
		
		return mapper.storelist();
	}
	
}
