package com.project.dndn.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.project.dndn.main.domain.LunchBoardDTO;
import com.project.dndn.main.service.LunchBoxService;

// dndn/
@Controller 
public class MainController {
	
	@Autowired
	LunchBoxService lunchBoxService;

	@GetMapping("/main.do")
	public String main(Model model) {
		
		// 1. 이달에 가장 HOT한 상품 [ 일단은 ] 
		// 2. 이번달 화려한 신상품
		// 3. 이번달 정기배송 BEST
		//    >      
		// 4. 카테고리별 BEST 상품 > JSON으로 한번에 다 뿌려주자.
		//    > 일반식, 건강식, 프리미엄, 정기배송 
		// 뿌려줘야할 것 원가, 할인된 가격, 
		
		List<LunchBoardDTO> list =  lunchBoxService.getRecentLunchServce();
		model.addAttribute("list", list);
		
		return "main";
	}
	@GetMapping("/template.do")
	public String template() {
		return "template";
	}
}
