package com.project.dndn.lunchdetail.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.project.dndn.lunchdetail.domain.LunchBoxDTO;
import com.project.dndn.lunchdetail.service.LunchDetailService;

@Controller
public class LunchDetailController {

	@Autowired
	private LunchDetailService service;

	@GetMapping("/lunchdetail/lunchdetail.do")
	public String lunchdetail() {
		return "lunchdetail/lunchdetail";
	}

	

	
	
	
	
	

}
