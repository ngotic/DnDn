package com.project.dndn.auth;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
		
	 UserDetails userDetails = (UserDetails) authentication.getPrincipal();
	        
	        // 세션에 사용자 정보 설정
        HttpSession session = request.getSession();
        session.setAttribute("userDetails", userDetails);
		log.info("Login Success");
		response.sendRedirect("/dndn/main.do");		
	}
	
}













