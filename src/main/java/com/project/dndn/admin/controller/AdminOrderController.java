package com.project.dndn.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.project.dndn.admin.service.AdminOrderService;

@Controller
public class AdminOrderController {

	@Autowired
	private AdminOrderService adminOrderService;
	
	@GetMapping("/admin/orderlist.do")
	public String orderlist(Model model) {

		model.addAttribute("orderlist", adminOrderService.orderlist());

		return "admin/orderlist";
	}
	
	@GetMapping("/admin/admin-main.do")
	public String main(Model model) {
		
		model.addAttribute("orderlist", adminOrderService.orderlist());

		return "admin/admin-main";
	}
	
}
