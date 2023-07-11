package com.project.dndn.inform.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.project.dndn.inform.domain.FaqDTO;
import com.project.dndn.inform.domain.NoticeDTO;
import com.project.dndn.inform.domain.PageDTO;
import com.project.dndn.inform.service.NoticeService;

@Controller
public class InformController {
	
	@Autowired
	private NoticeService noticeService;
	
	/*
	@PostMapping("/inform/notice.do")
	public String noticePost(Model model, 
			@RequestParam(required=false, defaultValue="1") int pageNo, 			NoticeDTO dto,
			@RequestParam(value="column", required=false, defaultValue="title") String column,
			@RequestParam(value="word", required=false, defaultValue="") String word) {
		
		System.out.println(column);
		
		notice(model, pageNo, dto, column, word);
		
		return "inform/notice";

	}
	*/
	
	@GetMapping("/inform/notice.do")
	   public String notice(Model model) {
	      
	      model.addAttribute("noticelist", noticeService.noticelist());
	         /* System.out.println(productService.list()); */
	      
	      model.addAttribute("mainlist",noticeService.mainlist());
	      
	      
	      return "inform/notice";
	   }
	
	
	
	
	
	/*
	@GetMapping("/inform/notice.do")
	public String noticeGet(Model model, 
			@RequestParam(required=false, defaultValue="1") int pageNo, NoticeDTO dto,
			@RequestParam(value="column", required=false, defaultValue="") String column,
			@RequestParam(value="word", required=false, defaultValue="") String word) {

		System.out.println("column: " + column);
		System.out.println(pageNo);
		if (!column.equals("")) {
			
			System.out.println("notice");
			notice(model, pageNo, dto, column, word);
			
		} else {
			notice2(model, pageNo, dto, column, word);

		}
		
		return "inform/notice";		

	}
	*/
	
	
	
	public void notice(Model model, int pageNo, NoticeDTO dto, String column, String word) {

		System.out.println("column: " + column);
		
		System.out.println("검색O: " + pageNo);
		
		PageDTO page = new PageDTO(pageNo,10,noticeService.getCount(column,word));
		
		Map<String, Integer> map = new HashMap<>();
		map.put("startNo", page.getStartNo());
		map.put("endNo", page.getEndNo());

			
		List<NoticeDTO> pagelist = noticeService.getSearchPageList(map, column, word);
		model.addAttribute("pagelist", pagelist);
		model.addAttribute("page", page);
		
	}
	

	public void notice2(Model model, int pageNo, NoticeDTO dto, String column, String word) {

		
		
		PageDTO page = new PageDTO(pageNo, 10,noticeService.getCount(column,word));
		
		System.out.println("검색X: " + pageNo);
		
		Map<String, Integer> map = new HashMap<>();
		map.put("startNo", page.getStartNo());
		map.put("endNo", page.getEndNo());
		

			
		List<NoticeDTO> pagelist = noticeService.getPageList(map);
		model.addAttribute("pagelist", pagelist);
		model.addAttribute("page", page);
		
	}
	
	

	
	
	@GetMapping("/inform/view.do")
	public String view(Model model, String noticeseq) {
		
		noticeService.views(noticeseq);
		
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

	@PreAuthorize("isAuthenticated() ")
   @PostMapping("/inform/delok")
   public String delok(NoticeDTO dto ,Model model) {
      
	
	  int result = noticeService.noticedel(dto);
	  
	  
	  if (result== 1) {
		  return "redirect:/inform/notice.do";
		  
		  
	  } else {
		  return "redirect:/main.do";
	  }
	  
      
   }
	
	
	
	
	@GetMapping("/inform/suggest.do")
	public String suggest() {
		
		return "inform/suggest";
	}
	
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/inform/main")
	public String main(NoticeDTO dto, String mainnotice) {
		
		System.out.println(mainnotice);
		
		if (mainnotice.toString().equals("F")) {
			
			System.out.println("메인지정" + mainnotice);
			
			noticeService.main(dto);
			
		} else if (mainnotice.toString().equals("T")) {
			
			System.out.println("메인취소" +mainnotice);
			
			noticeService.mainquit(dto);
			
		}
		
		
		return "redirect:/inform/notice.do";
	}


	
	@GetMapping("/inform/faq.do")
	   public String faq(Model model, FaqDTO dto) {
	      
	     model.addAttribute("faqlist", noticeService.faqlist(dto));
	      
	      
	      return "inform/faq";
	   }
	
	  
		



	
	
	
	
	
	
	
}




