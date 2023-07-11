package com.project.dndn.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.project.dndn.admin.domain.ProductDTO;
import com.project.dndn.admin.service.ProductService;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;

	@GetMapping("/admin/admin-main.do")
	public String main(Model model) {

		return "admin/admin-main";
	}
	
	@GetMapping("/admin/admin-main2.do")
	public String main2(Model model) {

		return "admin/admin-main2";
	}
	
	@PostMapping("/admin/admin-main.do")
	public String homeToMain(Model model) {

		return "admin/admin-main";
	}

	@GetMapping("/admin/product.do")
	public String list(Model model) {

		model.addAttribute("list", productService.list());
		/* System.out.println(productService.list()); */

		return "admin/product";
	}

	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/admin/product-add.do") public String add() {
	
	return "admin/product-add"; 
	}
	

	@PreAuthorize("isAuthenticated()")
	@PostMapping("/admin/product-addok.do")
	public String addok(ProductDTO dto) {

		int result = productService.add(dto);

		return "redirect:/admin/product.do";
	}

	@GetMapping("/admin/product-view.do")
	public String view(Model model, String lunchboxseq) {

		ProductDTO dto = productService.get(lunchboxseq);

		model.addAttribute("dto", dto);

		return "admin/product-view";

	}

	@PreAuthorize("isAuthenticated()")
	@GetMapping("/admin/product-edit.do")
	public String edit(Model model, String lunchboxseq, String id) {

		ProductDTO dto = productService.get(lunchboxseq);

		model.addAttribute("dto", dto);

		return "admin/product-edit";
	}

	@PreAuthorize("isAuthenticated()")
	@PostMapping("/admin/product-editok.do")
	public String editok(ProductDTO dto) {

		int result = productService.edit(dto);

		return "redirect:/admin/product-view.do?lunchboxseq=" + dto.getLunchboxseq();
	}
	

	@PreAuthorize("isAuthenticated()")
	@PostMapping("/admin/product-delok")
	public String delok(String lunchboxseq, Model model) {
		
		int result = productService.del2(lunchboxseq);
		
		if (result == 1) {
			return "redirect:/admin/product.do";
		} else {
			return null;
			
		}
	}
	

}
















