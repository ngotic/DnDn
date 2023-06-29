package com.project.dndn.auth.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.dndn.auth.domain.AuthDTO;
import com.project.dndn.auth.domain.MemberDTO;
import com.project.dndn.auth.mapper.MemberMapper;
import com.project.dndn.auth.service.MailSendService;


@Controller
public class MemberController {

	@Autowired
	private MemberMapper mapper;
	@Autowired
	private PasswordEncoder encoder;
	
	@GetMapping("/auth/register.do")
	public String register() {
		return "auth/register";
	}
	
	
	
	@PostMapping("/auth/registerok.do")
	public String registerok(Model model, MemberDTO dto) {
		
		dto.setPw(encoder.encode(dto.getPw()));
		dto.setAddress(dto.getAddress()+" "+dto.getAddressD());
		int result = mapper.register(dto);

		AuthDTO adto = new AuthDTO();
		adto.setId(dto.getId());
		adto.setAuth("ROLE_MEMBER");
		mapper.registerAuth(adto);
	
		
		model.addAttribute("result",result);
		
		return "auth/registerok";
		
	}
	@GetMapping("/auth/findidpw.do")
	public String findidpw() {
		return "auth/findidpw";
	}

	@PostMapping(value="/auth/findidpw.do" ,produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, String> findingId(@RequestBody MemberDTO vo)throws Exception {
		System.out.println(vo.toString());

		String id = mapper.findId(vo);
		System.out.println(id);
		
		if(id==null) {
			return null;
		}
		
		Map<String, String> response = new HashMap<>();
	    response.put("id", id);
	    
		return  response;
	}
	
	@PostMapping(value="/findpw" ,produces = "application/json; charset=utf-8")
	@ResponseBody
	public String findpw(@RequestBody MemberDTO vo)throws Exception {
		
		String enabled = mapper.findPw(vo);
		
		if(enabled==null) {
			return null;
		}
		
		else {
			return  enabled;
		}
	}
	@PostMapping(value="/updatepw" ,produces = "application/json; charset=utf-8")
	@ResponseBody
	public String updatepw(@RequestBody MemberDTO dto)throws Exception {
		System.out.println("비밀번호 변경 요청");
		dto.setPw(encoder.encode(dto.getPw()));
		mapper.updatepw(dto);
		return "updatepw";
	}
	
	@Autowired
	private MailSendService mailService;
	
	//비번 update
	@PostMapping("/emailVerify")
	@ResponseBody
	public String mailCheck(String emailInput , String id) {
		System.out.println("이메일 인증 요청이 들어옴!");
		System.out.println("이메일 인증 이메일 : " + emailInput);
		System.out.println("아이디 : " + id);
		System.out.println(mailService.joinEmail(emailInput));

		return mailService.joinEmail(emailInput);
	}

}
