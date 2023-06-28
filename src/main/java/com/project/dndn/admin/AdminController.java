package com.project.dndn.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {

	@GetMapping("/admin/product.do")
	public String adminProduct() {
		
		return "admin/product";
	}
	
	
}
