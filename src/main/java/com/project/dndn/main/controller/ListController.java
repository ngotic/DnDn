package com.project.dndn.main.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.project.dndn.lunchdetail.domain.WishDTO;
import com.project.dndn.lunchdetail.service.LunchDetailService;
import com.project.dndn.main.domain.LunchBoardDTO;
import com.project.dndn.main.domain.RecentDTO;
import com.project.dndn.main.domain.pagingDTO;
import com.project.dndn.main.service.LunchBoxService;

@Controller
public class ListController {
	
	@Autowired
	LunchBoxService lunchBoxService;
	
	// http://localhost:8091/dndn/list.do?page=1&category=1&sort=1
	// 서비스단에서 begin, end 계산 
    @GetMapping("/list.do")
    public String template(Model model, pagingDTO pdto, HttpServletRequest request) {
    	
    	// category
    	System.out.println("-->"+pdto);
    	
    	
    	Cookie[] cookies = request.getCookies();
		List<RecentDTO> relist = new ArrayList<RecentDTO>();
		if(cookies !=null ){
			for(int i = cookies.length-1 ; i>=0 ; i--){
				if(cookies[i].getName().startsWith("recent")){
					System.out.println("카운트");
					RecentDTO rdto = new RecentDTO();
					String[] divided = cookies[i].getValue().split("#");
					rdto.setUrl(divided[0]);
					rdto.setPic(divided[1]);
					relist.add(rdto);
				}
			}
		}
    	
    	
    	// 1. 검색조건으로 totalCnt를 구한다.
    	int cnt =  lunchBoxService.getTotalCnt(pdto);
    	pdto.setTotalCnt(cnt);
    	
    	System.out.println("일단계 통과 :"+cnt);
    	
    	// 2. 
    	List<LunchBoardDTO> list =  lunchBoxService.getLunchBoardList(pdto);
    	
    	model.addAttribute("list", list);
    	model.addAttribute("pdto", pdto);
    	model.addAttribute("relist", relist);
        return "item/list";
    }
    

    @GetMapping("/listByCategory")
    public ResponseEntity<List<LunchBoardDTO>> categoryfourItem(String category){
    	List<LunchBoardDTO> clist;
        try {
        	// 여기서 정기배송인 경우는 다른 쿼리로 가자 
        	clist = lunchBoxService.getLunchBoardByCategory(category);
            return new ResponseEntity<List<LunchBoardDTO>>(clist, HttpStatus.OK);
            
        }catch (Exception e){
            e.printStackTrace();
            return new ResponseEntity<List<LunchBoardDTO>>(HttpStatus.BAD_REQUEST);
        }
    }
    
}

