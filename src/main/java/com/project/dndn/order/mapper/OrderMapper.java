package com.project.dndn.order.mapper;

import java.util.ArrayList;

import com.project.dndn.order.domain.OrderDTO;

public interface OrderMapper {

	ArrayList<OrderDTO> userlist();

	OrderDTO user(String user_id);

	ArrayList<OrderDTO> order(String user_id);

	ArrayList<OrderDTO> storeuserlist();

	OrderDTO storeuser(String user_id);

	ArrayList<OrderDTO> storeorder(String store_seq);
		
}
