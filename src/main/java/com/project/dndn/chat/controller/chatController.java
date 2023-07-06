package com.project.dndn.chat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class chatController {

	
	@GetMapping("/chat/test.do")
	public String test() {
		
		return "chat/test";
	}

	@GetMapping("/chat/admin.do")
	public String admin() {
		
		return "chat/admin";
	}
	
	@GetMapping("/chat/user.do")
	public String user() {
		
		return "chat/user";
	}

	@GetMapping("/chat/index.do")
	public String index() {
		
		return "chat/index";
	}
	
	@GetMapping("/chat/chat.do")
	public String chat() {
		
		return "chat/chat";
	}
	
}
