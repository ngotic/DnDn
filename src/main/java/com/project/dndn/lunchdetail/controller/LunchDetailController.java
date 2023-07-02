package com.project.dndn.lunchdetail.controller;

import com.project.dndn.lunchdetail.domain.StoreLocationDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.project.dndn.lunchdetail.domain.LunchBoxDTO;
import com.project.dndn.lunchdetail.service.LunchDetailService;

import java.security.Principal;
import java.util.List;

@Controller
public class LunchDetailController {

	@Autowired
	private LunchDetailService service;

	@GetMapping("/lunchdetail/detail.do")
	public String lunchdetail(String seq, String period, Model model, Principal principal) {

		// 1. 정기, 비정기배송에 따라 나오는 lunchdetail 구분 > 'query String' 사용
		// 2. boardDetail을 받아서 맞는 정보 리턴
		// 3. 지점정보 같이 넣어주기

		System.out.println("출력 : "+seq+"/"+period);
		LunchBoxDTO ldto = service.getLunchBoxDetail(period, seq);
		List<StoreLocationDTO> locations = service.getStoreLocations();

		// ldto.getPic()

		if( principal == null ) {
			model.addAttribute("boardlike", null);
		}  else {
			int result = service.checkBoardWishList(principal.getName(), Integer.parseInt(seq));
			model.addAttribute("boardlike", result);
			System.out.println("boardlike " + result);
		}

		model.addAttribute("ldto", ldto);
		model.addAttribute("locations", locations);

		return "lunchdetail/lunchdetail";
	}

}
