package com.project.dndn.auth.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
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
	
	@PreAuthorize("isAnonymous()")
	@GetMapping("/auth/register.do")
	public String register(@RequestParam(name = "name",required = false) String name,
				            @RequestParam(name = "email",required = false) String email,
				            @RequestParam(name = "gender",required = false) String gender
				            , Model model){
		if(name != null || email !=null || gender!=null) {
			MemberDTO dto = new MemberDTO();
		    dto.setName(name);
		    dto.setEmail(email);
		    dto.setGender(gender);
		    System.out.println(dto.toString());
	    	model.addAttribute("dto", dto);
	    }
		
		return "auth/register";
	}
	
	
	
	@PostMapping("/auth/registerok.do")
	@ResponseBody
	public void registerok(Model model, @RequestBody MemberDTO dto) {
		
		dto.setPw(encoder.encode(dto.getPw()));
		int result = mapper.register(dto);

		AuthDTO adto = new AuthDTO();
		adto.setId(dto.getId());
		adto.setAuth("ROLE_MEMBER");
		mapper.registerAuth(adto);
	}
	
	@GetMapping("/auth/findidpw.do")
	public String findidpw() {
		return "auth/findidpw";
	}

	//아이디 찾기 
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
			return  "result";
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

		return mailService.joinEmail(emailInput);
	}

	//아이디 유효성 검사
	@PostMapping(value="/idvalidcheck" ,produces = "application/json; charset=utf-8")
	@ResponseBody
	public String idvalidcheck(@RequestBody MemberDTO dto)throws Exception {
		System.out.println(dto.toString());
		
		String id = mapper.idvalidcheck(dto);
		System.out.println(id);
		
		if(id!=null) {
			return id;
		}
		
		
		return null;
	}
	
	//이메일 유효성 검사
	@PostMapping(value="/emailvalidcheck" ,produces = "application/json; charset=utf-8")
	@ResponseBody
	public String emailvalidcheck(@RequestBody MemberDTO dto)throws Exception {
		System.out.println(dto.toString());
		String email = mapper.emailvalidcheck(dto);
		System.out.println(email);
		
		if(email!=null) {
			return email;
		}
		
		
		return null;
	}
	
	
	//회원탈퇴
	@PreAuthorize("isAuthenticated()")
	@PostMapping(value="/delacc")
	public String delacc(@RequestBody MemberDTO dto) {
		System.out.println(dto.toString());
		Random r = new Random();
		int randompw = r.nextInt(888888) + 111111;
		String randompwString = String.valueOf(randompw);
		
		dto.setPw(encoder.encode(randompwString));
		System.out.println("권한삭제");
		mapper.delaccAuth(dto);
		System.out.println("계정 정보 삭제");
		mapper.delacc(dto);
		
		return "redirect:/auth/logout.do";
	}
	
}
