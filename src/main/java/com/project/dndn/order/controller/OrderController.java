package com.project.dndn.order.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.project.dndn.order.service.OrderService;

@Controller
public class OrderController {

	
	 @Autowired 
	 private OrderService service;
	
	
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

	@GetMapping("/order/stat.do")
	public String stat() {
		
		return  "order/stat";
	}
	
	@GetMapping("/order/user.do")
	public String user(Model model) {
		
		
		
		
		return  "order/user-management";
	}
	
	@GetMapping("/order/store.do")
	public String store() {
		
		
		
		
		
		return  "order/store-management";
	}
	
	
	
	

	
	@GetMapping("/order/template.do")
	public String template() {
		
		return  "order/order-template-admin";
	}
}
