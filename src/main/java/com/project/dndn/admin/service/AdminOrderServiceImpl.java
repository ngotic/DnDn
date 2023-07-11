package com.project.dndn.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dndn.admin.domain.AdminOrderDTO;
import com.project.dndn.admin.mapper.AdminOrderMapper;

@Service
public class AdminOrderServiceImpl implements AdminOrderService {
	
	@Autowired
	private AdminOrderMapper mapper;
	
	@Override
	public List<AdminOrderDTO> orderlist() {
		
		return mapper.orderlist();
	}
	
}
