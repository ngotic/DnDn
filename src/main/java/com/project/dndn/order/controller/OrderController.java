package com.project.dndn.order.controller;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.project.dndn.order.domain.OrderDTO;
import com.project.dndn.order.service.OrderService;



@Controller
public class OrderController {

	
	@Autowired
	private OrderService orderService;
	
	
	@GetMapping("/order/main.do")
	public String main() {
		
		return "order/main";
	}
	
	@GetMapping("/order/event.do")
	public String event() {
		
		return "order/event";
	}
	
	@GetMapping("/order/event-page.do")
	public String eventpage() {
		
		return "order/event-page";
	}

	@GetMapping("/order/event-management.do")
	public String event_manegement() {
		
		return "order/event-management";
	} 
	
	@GetMapping("/order/stat.do")
	public String stat() {
		
		return  "order/stat";
	}
	
	@GetMapping("/order/user.do")
	public String user(Model model ,String user_id) {
	
			
		
	
		  ArrayList<OrderDTO> userlist = orderService.userlist();
		  
		  if( user_id != null) {
			
			 OrderDTO userdto = orderService.user(user_id);
			  ArrayList<OrderDTO>  orderlist = orderService.order(user_id);
			  
			 model.addAttribute("userdto",userdto);
			 model.addAttribute("orderlist",orderlist);
		  }
		  
		  //System.out.println(userlist);
		  
		  model.addAttribute("userlist", userlist);
		  
		  
		  
		 
		return  "order/user-management";
	}
	
	



	@GetMapping("/order/store-user.do")
	public String store(Model model ,String user_id,String store_seq) {
	

		  ArrayList<OrderDTO> userlist = orderService.storeuserlist();
		  
		  if( user_id != null) {
			
			 OrderDTO userdto = orderService.storeuser(user_id);
			 if(store_seq != null) {
			 	ArrayList<OrderDTO>  orderlist = orderService.storeorder(store_seq);
			 	
			 }
			 model.addAttribute("userdto",userdto);
			 
		  }
		  
		  //System.out.println(userlist);
		  
		  model.addAttribute("userlist", userlist);
		  
		
		
		return  "order/store-management";
	}
	
	
	
	
	@GetMapping("/order/template.do")
	public String template() {
		
		return  "order/order-template-admin";
	}
}
