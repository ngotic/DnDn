package com.project.dndn.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.project.dndn.admin.service.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@GetMapping("/admin/product.do")
	public String list(Model model) {
		
		model.addAttribute("list", productService.list());
		System.out.println(productService.list());
		
		return "admin/product";
	}
	
	
	
	
	
}
