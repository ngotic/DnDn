package com.project.dndn.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


// dndn/
@Controller 
public class MainController {
    
	@GetMapping("/main.do")
	public String main(){
		
	        return "main";
	}

	
	@GetMapping("/template.do")
	public String template() {
		return "template";
	}
	
}
