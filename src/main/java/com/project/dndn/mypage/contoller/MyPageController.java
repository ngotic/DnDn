package com.project.dndn.mypage.contoller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.project.dndn.mypage.domain.MyPageDTO;
import com.project.dndn.mypage.service.MyPageService;


@Controller
public class MyPageController {
	
	@Autowired
	private MyPageService myService;
	
	@Autowired
	private PasswordEncoder encoder;
	
	@GetMapping("/mypage/edit.do")
	public String edit(MyPageDTO dto, Model model, Authentication a) {
		
		String id = a.getName();
		
		System.out.println(id);
		
		List<MyPageDTO> list = myService.list(id);
		
		model.addAttribute("list",list);
		model.addAttribute("eidx",list.get(0).getEmail().indexOf("@"));
		model.addAttribute("tFidx",list.get(0).getTel().indexOf("-")+1);
		model.addAttribute("tLidx",list.get(0).getTel().lastIndexOf("-")+1);
		
		return "mypage/edit";
	}
	
	@PostMapping("/mypage/editok.do")
	public String editok(MyPageDTO dto, Model model,String[] telList,String[] emailList ) {
		
		String email = emailList[0]+"@"+emailList[1];
		String tel = "010-"+telList[0]+"-"+telList[1];
		
		dto.setPw(encoder.encode(dto.getPw()));
		dto.setEmail(email);
		dto.setTel(tel);
		
		myService.add(dto);
		
		return "redirect:/mypage/edit.do";
	}
	
	@GetMapping("/mypage/food.do")
	public String food(Authentication a) {
		
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
	public String buylist(Authentication a) {
		
		
		
		return "/mypage/buylist";
	}
}
