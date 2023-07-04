package com.project.dndn.mypage.contoller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
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

	@PreAuthorize("isAuthenticated()")
	@GetMapping("/mypage/edit.do")
	public String edit(MyPageDTO dto, Model model, Authentication a) {

		String id = a.getName();

		System.out.println(id);

		List<MyPageDTO> list = myService.list(id);

		model.addAttribute("list", list);
		model.addAttribute("eidx", list.get(0).getEmail().indexOf("@"));
		model.addAttribute("tFidx", list.get(0).getTel().indexOf("-") + 1);
		model.addAttribute("tLidx", list.get(0).getTel().lastIndexOf("-") + 1);

		return "mypage/edit";
	}

	@PreAuthorize("isAuthenticated()")
	@PostMapping("/mypage/editok.do")
	public String editok(MyPageDTO dto, Model model, String[] telList, String[] emailList) {

		String email = emailList[0] + "@" + emailList[1];
		String tel = "010-" + telList[0] + "-" + telList[1];

		dto.setEmail(email);
		dto.setTel(tel);

		if (dto.getPw() == "" || dto.getPw() == null) {

			dto.setPw(null);
		} else {

			dto.setPw(encoder.encode(dto.getPw()));
		}

		myService.add(dto);

		return "redirect:/mypage/edit.do";
	}

	@PreAuthorize("isAuthenticated()")
	@GetMapping("/mypage/food.do")
	public String food(Authentication a, Model model) {

		model.addAttribute(a);

		String id = a.getName();

		List<MyPageDTO> Flist = myService.Flist(id);

		return "/mypage/food";
	}

	@PreAuthorize("isAuthenticated()")
	@GetMapping("/mypage/order.do")
	public String order(Authentication a, Model model) {

		model.addAttribute(a);

		String id = a.getName();

		List<MyPageDTO> Olist = myService.Olist(id);

		model.addAttribute("Olist", Olist);

		return "/mypage/order";
	}

	@PreAuthorize("isAuthenticated()")
	@GetMapping("/mypage/fav.do")
	public String fav() {

		return "/mypage/fav";
	}

	@PreAuthorize("isAuthenticated()")
	@GetMapping("/mypage/buylist.do")
	public String buylist(Authentication a) {

		return "/mypage/buylist";
	}
}
