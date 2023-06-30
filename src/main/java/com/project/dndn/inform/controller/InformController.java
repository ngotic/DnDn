package com.project.dndn.inform.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class InformController {

	@GetMapping("/inform/notice.do")
	public String notice() {
		return "inform/notice";
	}
	
	
	@GetMapping("/inform/view.do")
	public String view() {
		
		return "inform/view";
	}

	@GetMapping("/inform/add.do")
	public String add() {
		
		return "inform/add";
	}
	
	@GetMapping("/inform/suggest.do")
	public String suggest() {
		
		return "inform/suggest";
	}
	
	
	
}
