package com.project.dndn.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MyPageController {

	@GetMapping("/mypage/edit.do")
	public String edit() {
		
		return "mypage/edit";
	}
	
	@GetMapping("/mypage/food.do")
	public String food() {
		
		return "/mypage/food";
	}
	
	@GetMapping("/mypage/order.do")
	public String order() {
		
		return "/mypage/order";
	}
	
	@GetMapping("/mypage/fav.do")
	public String fav() {
		
		return "/mypage/fav";
	}
	
	@GetMapping("/mypage/buylist.do")
	public String buylist() {
		
		return "/mypage/buylist";
	}
}
