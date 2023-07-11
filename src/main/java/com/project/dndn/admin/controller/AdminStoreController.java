package com.project.dndn.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.project.dndn.admin.service.AdminStoreService;

@Controller
public class AdminStoreController {
	
	@Autowired
	private AdminStoreService adminStoreService;
	

	@GetMapping("/admin/store.do")
	public String storelist(Model model) {

		model.addAttribute("storelist", adminStoreService.storelist());
		
		return "admin/store";
	}

	
}
