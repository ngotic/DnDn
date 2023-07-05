package com.project.dndn.mypage.contoller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.dndn.mypage.domain.MyPageDTO;
import com.project.dndn.mypage.mapper.MyPageMapper;
import com.project.dndn.mypage.service.MyPageService;

@Controller
public class MyPageController {

	@Autowired
	private MyPageService myService;
	
	@Autowired
	private MyPageMapper myMapper;
	
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
	public String food(Model model, Authentication a) {
		
		String id = a.getName();

		List<MyPageDTO> Flist = myService.Flist(id);

		return "/mypage/food";
	}

	@PreAuthorize("isAuthenticated()")
	@GetMapping("/mypage/order.do")
	public String order(Model model, Authentication a) {
		
		String id = a.getName();

		List<MyPageDTO> Olist = myService.Olist(id);

		model.addAttribute("Olist", Olist);

		return "/mypage/order";
	}

	@PreAuthorize("isAuthenticated()")
	@GetMapping("/mypage/fav.do")
	public String fav(Model model, Authentication a) {
		
		String id = a.getName();
		
		List<MyPageDTO> wlist = myService.wlist(id);

		model.addAttribute("wlist", wlist);
		
		return "/mypage/fav";
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/mypage/fav/{wishlistseq}/{wishsellboardseq}/{num}")
	@ResponseBody
   	public int favok(@PathVariable("wishlistseq") String wishlistseq, Model model, Authentication a, @PathVariable("num") String num, @PathVariable("wishsellboardseq") String wishsellboardseq) {

		System.out.println("wlist");
		
		String id = a.getName();
		
		Map<String,String> map = new HashMap<String,String>();
		
		map.put("id", id);
		map.put("wishlistseq", wishlistseq);
		map.put("wishsellboardseq", wishsellboardseq);
		map.put("num", num);
		
		return myService.wdlist(map);
	}

	@PreAuthorize("isAuthenticated()")
	@GetMapping("/mypage/buylist.do")
	public String buylist(Authentication a) {

		String id = a.getName();

		return "/mypage/buylist";
	}
}
