package com.project.dndn.inform.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.project.dndn.inform.domain.NoticeDTO;
import com.project.dndn.inform.service.NoticeService;

@Controller
public class InformController {
	
	@Autowired
	private NoticeService noticeService;
	
	

	@GetMapping("/inform/notice.do")
	public String notice(Model model) {
		
		
		
		model.addAttribute("noticelist", noticeService.noticelist());
		
		return "inform/notice";
	}
	
	
	
	
	
	
	
	
	@GetMapping("/inform/view.do")
	public String view(Model model, String noticeseq) {
		
		  NoticeDTO dto = noticeService.noticeget(noticeseq);
		   
		  model.addAttribute("dto", dto);
		
		
		return "inform/view";
	}
	
	
	

	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/inform/notice_add.do")
	public String add() {
		
		return "inform/notice_add";
	}

	@PreAuthorize("isAuthenticated()")
	@PostMapping("/inform/addok.do")
	public String addok(NoticeDTO dto) {
		
		int result = noticeService.add(dto);
		
		
		return "redirect:/inform/notice.do";
	}
	
	
	@PreAuthorize("isAuthenticated() and principal.username == #id")
   @GetMapping("/inform/notice_edit.do")
   public String edit(Model model, String noticeseq, String id) {
      
	  NoticeDTO dto = noticeService.noticeget(noticeseq);
	   
	  model.addAttribute("dto", dto);
	   
      return "inform/notice_edit";
   }
	

	@PreAuthorize("isAuthenticated()")
   @PostMapping("/inform/notice_editok.do")
   public String editok(NoticeDTO dto) {
      
	  int result = noticeService.noticeedit(dto);
	   
      return "redirect:/inform/view?noticeseq=" + dto.getNoticeseq();
   }

	
	
	
	
	
	@GetMapping("/inform/suggest.do")
	public String suggest() {
		
		return "inform/suggest";
	}


	
	
	
	  
		



	
	
	
	
	
	
	
}




