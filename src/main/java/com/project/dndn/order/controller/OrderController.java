package com.project.dndn.order.controller;


import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.project.dndn.order.domain.OrderDTO;
import com.project.dndn.order.domain.OrderEventDTO;
import com.project.dndn.order.service.OrderService;



@Controller
public class OrderController {

	
	@Autowired
	@Qualifier("orderService")
	private OrderService orderService;
	
	
	@GetMapping("/order/main.do")
	public String main() {
		
		return "order/main";
	}
	
	@GetMapping("/order/event.do")
	public String event(Model model ,String open_close) {
		ArrayList<OrderEventDTO> eventlist = null;
		
		if(open_close != null) {
		if(open_close.equals("open")) 
			eventlist = orderService.eventopenlist();
		else if(open_close.equals("close"))
			eventlist = orderService.eventcloselist();
		}else 
			eventlist = orderService.eventlist();


		
		 
		
		model.addAttribute("eventlist", eventlist);
		
		
		
		return "order/event";
	}
	
	
	
	@GetMapping("/order/event-page.do")
	public String eventpage(Model model, String event_seq) {
		
		orderService.updatecount(event_seq);
		
		OrderEventDTO eventdto = orderService.eventdto(event_seq); 
		
		List<OrderEventDTO> eventpage = orderService.eventpage(event_seq);
		
		model.addAttribute("eventdto", eventdto);
		
		model.addAttribute("eventpage",eventpage);
		
		
		return "order/event-page";
	}

	@GetMapping("/order/event-management.do")
	public String event_manegement(Model model ,String event_seq,boolean edit) {
		
		ArrayList<OrderEventDTO> eventlist = orderService.eventlist(); 
		
		model.addAttribute("eventlist", eventlist);
		
		if(event_seq !=null) {
			
			OrderEventDTO eventdto = orderService.eventdto(event_seq);
			
			model.addAttribute("eventdto",eventdto);
			
		}else {
			OrderEventDTO eventnulldto = orderService.eventnulldto();
			
			model.addAttribute("eventdto",eventnulldto);
			
		}
	
		model.addAttribute("edit" , edit);
		
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
				/*  
				 
				 	더미데이터 없어서 오류발생 (Cartseq 로 inner join 해야하는데 없어서 못함)
				 	
					ArrayList<OrderDTO> orderlist = orderService.order(user_id); 
					
				*/
			  
			 model.addAttribute("userdto",userdto);
				/* 
					  
				 model.addAttribute("orderlist",orderlist); 
				 */
		  }else{
			  OrderDTO userdtonull = orderService.usernull();
			  model.addAttribute("userdto",userdtonull);
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
