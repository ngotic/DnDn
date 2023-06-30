package com.project.dndn.order.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.project.dndn.order.domain.OrderDTO;
import com.project.dndn.order.mapper.OrderMapper;

@Service("orderService")
public class OrderServiceImpl implements OrderService{

	@Autowired
	@Qualifier("orderMapper")
	private OrderMapper ordermapper;
	
	
	@Override
	public ArrayList<OrderDTO> userlist() {
		
		return ordermapper.userlist();
	}
	
	
	@Override
	public OrderDTO user(String user_id) {
		
		OrderDTO dto =  ordermapper.user(user_id);
		
		return dto;
	}
	
	@Override
	public ArrayList<OrderDTO> order(String user_id) {
		
		ArrayList<OrderDTO>  dto = ordermapper.order(user_id);
		
		return dto;
	}

	@Override
	public ArrayList<OrderDTO> storeuserlist() {
		
		return ordermapper.storeuserlist();
	}

	@Override
	public OrderDTO storeuser(String user_id) {
		OrderDTO dto =  ordermapper.storeuser(user_id);
		
		return dto;
	}
	
	@Override
	public ArrayList<OrderDTO> storeorder(String store_seq) {
		
		ArrayList<OrderDTO>  dto = ordermapper.storeorder(store_seq);
		
		return dto;
	}
	
}
