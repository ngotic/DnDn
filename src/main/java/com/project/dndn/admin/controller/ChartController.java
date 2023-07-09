package com.project.dndn.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.dndn.admin.domain.ChartDTO;
import com.project.dndn.admin.service.ChartService;


@Controller
public class ChartController {
	
	@Autowired
	private ChartService chartService;
	
	@GetMapping("/admin/chart.do")
	public String chartmain(Model model) {

		return "admin/chart";
	}
	
	@GetMapping("/admin/chart3.do")
	public String charttest(Model model) {

		return "admin/chart3";
	}
	
	
	public @ResponseBody List<ChartDTO> countRegdate(Model model, ChartDTO dto) throws Exception {
		
		List<ChartDTO> regdate = chartService.countRegdate(dto);
		model.addAttribute("regdate", regdate);

		return regdate;
		
	}
	
}
