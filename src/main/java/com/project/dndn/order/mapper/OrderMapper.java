package com.project.dndn.order.mapper;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.project.dndn.order.domain.OrderCouponDTO;
import com.project.dndn.order.domain.OrderDTO;
import com.project.dndn.order.domain.OrderEventDTO;

public interface OrderMapper {

	ArrayList<OrderDTO> userlist();

	OrderDTO user(String user_id);

	ArrayList<OrderDTO> order(String user_id);

	ArrayList<OrderDTO> storeuserlist();

	OrderDTO storeuser(String user_id);

	ArrayList<OrderDTO> storeorder(String store_seq);

	ArrayList<OrderEventDTO> eventlist();

	OrderEventDTO eventdto(String event_seq);

	void updatecount(String event_seq);



	OrderEventDTO eventnulldto();



	OrderDTO usernull();

	List<OrderEventDTO> eventpage(String event_seq);

	ArrayList<OrderEventDTO> eventopenlist();

	ArrayList<OrderEventDTO> eventcloselist();

	void insertevent(OrderEventDTO dto);

	ArrayList<OrderCouponDTO> couponlist();

	void insertcoupon(OrderCouponDTO dto);

	void updatecoupon(OrderCouponDTO dto);

	void deletecoupon(String coupon_seq);
		
	
	
	
}
