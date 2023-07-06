	package com.project.dndn.auth.controller;

import java.net.URLEncoder;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.dndn.auth.domain.CustomUser;
import com.project.dndn.auth.domain.MemberDTO;
import com.project.dndn.auth.mapper.MemberMapper;
import com.project.dndn.auth.service.UserService;
import com.project.dndn.security.CustomUserDetailsService;

@Controller 
public class AuthController {
	
	@PreAuthorize("isAnonymous()")
	@GetMapping("/auth/login.do")
	public String login() {
		return "auth/login";
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/auth/logout.do")
    public String logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
		return "redirect:/main.do";
	}
	
	private final UserService userService;

    public AuthController(UserService userService) {
        this.userService = userService;
    }
    
	@Autowired
	private MemberMapper mapper;
	@Autowired
	private PasswordEncoder encoder;
	@Autowired
    private CustomUserDetailsService userDetailsService;
	private MemberDTO member;
    
	@GetMapping("/kakao") 
	public String main(@RequestParam String code,Model model) throws Throwable{
		MemberDTO dto = new MemberDTO();
		String accessToken = userService.getKaKaoAccessToken(code);
		HashMap<String, Object> userInfo = userService.getUserInfo(accessToken);
		System.out.println(userInfo); // 사용자 정보 출력
		System.out.println(code);
		dto.setName(userInfo.get("nickname").toString());
		dto.setEmail(userInfo.get("email").toString());
		dto.setGender(userInfo.get("gender").toString());
		
		System.out.println(dto.getName());
		System.out.println(dto.getEmail());
		System.out.println(dto.getGender());
		String username =mapper.findId(dto);
		dto.setId(username);
		System.out.println(dto.getId());
		
		if(username==null) {
			
			 return "redirect:/auth/register.do?name=" + URLEncoder.encode(dto.getName(), "UTF-8")
	            + "&email=" + URLEncoder.encode(dto.getEmail(), "UTF-8")
	            + "&gender=" + URLEncoder.encode(dto.getGender(), "UTF-8");
		}
		else {
			UserDetails userDetails = userDetailsService.loadUserByUsername(dto.getId());
			Authentication authentication = new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
			SecurityContextHolder.getContext().setAuthentication(authentication);
			return "redirect:/main.do";
		}
	}
	 

}
