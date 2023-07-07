package com.project.dndn.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ChartController {
	
	@GetMapping("/admin/chart.do")
	public String chartmain(Model model) {

		return "admin/chart";
	}
	
}
