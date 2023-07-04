package com.project.dndn.order.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.project.dndn.order.domain.OrderDTO;
import com.project.dndn.order.domain.OrderEventDTO;
import com.project.dndn.order.mapper.OrderMapper;

@Service("orderService")
public class OrderServiceImpl implements OrderService{

	@Autowired
	@Qualifier("orderMapper")
	private OrderMapper orderMapper;
	
	
	@Override
	public ArrayList<OrderDTO> userlist() {
		
		return orderMapper.userlist();
	}
	
	@Override
	public OrderDTO usernull() {
		OrderDTO dto =  orderMapper.usernull();
		return dto;
	}
	@Override
	public OrderDTO user(String user_id) {
		
		OrderDTO dto =  orderMapper.user(user_id);
		
		return dto;
	}
	
	@Override
	public ArrayList<OrderDTO> order(String user_id) {
		
		ArrayList<OrderDTO>  dto = orderMapper.order(user_id);
		
		return dto;
	}

	@Override
	public ArrayList<OrderDTO> storeuserlist() {
		
		return orderMapper.storeuserlist();
	}

	@Override
	public OrderDTO storeuser(String user_id) {
		OrderDTO dto =  orderMapper.storeuser(user_id);
		
		return dto;
	}
	
	@Override
	public ArrayList<OrderDTO> storeorder(String store_seq) {
		
		ArrayList<OrderDTO>  dto = orderMapper.storeorder(store_seq);
		
		return dto;
	}
	
	@Override
	public ArrayList<OrderEventDTO> eventlist() {
		
		ArrayList<OrderEventDTO> dto = orderMapper.eventlist();
		
		
		return dto;
	}
	
	
	@Override
	public ArrayList<OrderEventDTO> eventopenlist() {
		
		ArrayList<OrderEventDTO> dto = orderMapper.eventopenlist();
		
		return dto;
	}
	
	@Override
	public ArrayList<OrderEventDTO> eventcloselist() {
		ArrayList<OrderEventDTO> dto = orderMapper.eventcloselist();
		
		return dto;
	}
	
	
	@Override
	public OrderEventDTO eventdto(String event_seq) {
		
		OrderEventDTO dto =  orderMapper.eventdto(event_seq);
		
		return dto;
	}
	

	
	@Override
	public void updatecount(String event_seq) {
		
		orderMapper.updatecount(event_seq);
		
		
	}
	
	@Override
	public OrderEventDTO eventnulldto() {
		OrderEventDTO dto = orderMapper.eventnulldto();
		return dto;
	}
	
	
	@Override
	public List<OrderEventDTO> eventpage(String event_seq) {
		
		List<OrderEventDTO> eventpage = orderMapper.eventpage(event_seq);
		
		return eventpage;
		
	}
	

}
