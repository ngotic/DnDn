package com.project.dndn.store.controller;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.project.dndn.service.StoreService;
import com.project.dndn.store.domain.StoreDTO;


@Controller
public class StoreController {

	@Autowired
	@Qualifier("storeService")
	private StoreService storeservice;
	
	@GetMapping("/storemap/storehome.do")
	public String login(Model model) {
		try {
           ArrayList<StoreDTO> blist = storeservice.getBuildingList();
            model.addAttribute("blist", blist);
        } catch (Exception e) {
            e.printStackTrace();
            // Handle the exception appropriately
        }
		return "storemap/storehome";	
	}
	
	
	
}
