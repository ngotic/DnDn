package com.project.dndn.lunchdetail.controller;

import com.project.dndn.lunchdetail.domain.StoreLocationDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.project.dndn.lunchdetail.domain.LunchBoxDTO;
import com.project.dndn.lunchdetail.domain.ReviewDTO;
import com.project.dndn.lunchdetail.service.LunchDetailService;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.security.Principal;
import java.util.List;

@Controller
public class LunchDetailController {

	@Autowired
	private LunchDetailService service;

	@GetMapping("/lunchdetail/detail.do")
	public String lunchdetail(String seq, String period, Model model, Principal principal, HttpServletRequest request, HttpServletResponse response) {

		// 1. 정기, 비정기배송에 따라 나오는 lunchdetail 구분 > 'query String' 사용
		// 2. boardDetail을 받아서 맞는 정보 리턴
		// 3. 지점정보 같이 넣어주기
		
		System.out.println("출력 : "+seq+"/"+period);
		
		LunchBoxDTO ldto = service.getLunchBoxDetail("F", seq);
		List<StoreLocationDTO> locations = service.getStoreLocations();

		String url = request.getRequestURI()+"?seq="+seq+"&period="+period;
		String pic = ldto.getPic();

		Cookie[] cookies = request.getCookies();
		if(cookies !=null ){
			if(cookies.length > 3) {
				Cookie delCookie = new Cookie(cookies[0].getName(), null);
				delCookie.setPath("/dndn/");
				delCookie.setMaxAge(0);
				response.addCookie(delCookie);

				Cookie cookie = new Cookie("recent_"+seq, url+"#"+pic );
				cookie.setPath("/dndn/");
				cookie.setMaxAge(60*60*24);
				response.addCookie(cookie);
			} else {
				Cookie cookie = new Cookie("recent_"+seq, url+"#"+pic );
				cookie.setPath("/dndn/");
				cookie.setMaxAge(60*60*24);
				response.addCookie(cookie);
			}
		} else {
			Cookie cookie = new Cookie("recent_"+seq, url+"#"+pic );
			cookie.setPath("/dndn/");
			cookie.setMaxAge(60*60*24);
			response.addCookie(cookie);
		}

		if( principal == null ) {
			model.addAttribute("boardlike", null);
		}  else {
			int result = service.checkBoardWishList(principal.getName(), Integer.parseInt(seq));
			model.addAttribute("boardlike", result);
			System.out.println("boardlike " + result);
		}
		
		List<ReviewDTO> rlist = service.listReview(seq);
		
		model.addAttribute("rlist", rlist); // 리뷰 리스트 
		model.addAttribute("ldto", ldto);
		model.addAttribute("locations", locations);
		
		if(period.equals("F"))
			return "lunchdetail/lunchdetail";      // [ 일반상품 ] 페이지
		else 
			return "lunchdetail/lunchdetailperiod";// [ 정기배송 ] 전용페이지
	}

}
