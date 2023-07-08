package com.project.dndn.main.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.project.dndn.lunchdetail.domain.WishDTO;
import com.project.dndn.lunchdetail.service.LunchDetailService;
import com.project.dndn.main.domain.LunchBoardDTO;
import com.project.dndn.main.service.LunchBoxService;

@Controller
public class ListController {
	
	@Autowired
	LunchBoxService lunchBoxService;
	
    @GetMapping("/list.do")
    public String template() {
        return "item/list";
    }
    

    @GetMapping("/listByCategory")
    public ResponseEntity<List<LunchBoardDTO>> categoryfourItem(String category){
    	List<LunchBoardDTO> clist;
        try {
        	clist = lunchBoxService.getLunchBoardByCategory(category);
            return new ResponseEntity<List<LunchBoardDTO>>(clist, HttpStatus.OK);
            
        }catch (Exception e){
            e.printStackTrace();
            return new ResponseEntity<List<LunchBoardDTO>>(HttpStatus.BAD_REQUEST);
        }
    }
    
}

