package com.project.dndn.order.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.dndn.order.domain.OrderCouponDTO;
import com.project.dndn.order.domain.OrderDTO;
import com.project.dndn.order.domain.OrderEventDTO;
import com.project.dndn.order.service.OrderService;

@Controller
public class OrderController {

	@Autowired
	@Qualifier("orderService")
	private OrderService orderService;

	@GetMapping("/order/main.do")
	public String main() {

		return "order/main";
	}

	@GetMapping("/order/event.do")
	public String event(Model model, String open_close) {
		ArrayList<OrderEventDTO> eventlist = null;

		if (open_close != null) {
			if (open_close.equals("open"))
				eventlist = orderService.eventopenlist();
			else if (open_close.equals("close"))
				eventlist = orderService.eventcloselist();
		} else
			eventlist = orderService.eventlist();

		model.addAttribute("eventlist", eventlist);

		return "order/event";
	}

	@GetMapping("/order/event-page.do")
	public String eventpage(Model model, String event_seq) {

		orderService.updatecount(event_seq);

		OrderEventDTO eventdto = orderService.eventdto(event_seq);

		List<OrderEventDTO> eventpage = orderService.eventpage(event_seq);

		model.addAttribute("eventdto", eventdto);

		model.addAttribute("eventpage", eventpage);

		return "order/event-page";
	}

	  //이벤트 이미지 삽입
	 /* 
	 	@GetMapping("/order/event-management.do") public String
	  uploadImage(@RequestParam("pic")MultipartFile pic,
	  
	  @RequestParam("pic_board")MultipartFile pic_board, String edit){
	  
	  if (pic.isEmpty()) { return "No file uploaded"; }
	  
	  System.out.println("실행ㅅ!!!"); try { // 이미지 파일을 저장할 경로 설정 String uploadPath =
	  "/src/main/webapp/resources/img/event/";
	  
	  // 업로드된 파일의 원본 이름 가져오기 String picimg = pic.getOriginalFilename(); String
	  pic_boardimg = pic_board.getOriginalFilename(); // 저장할 파일 경로와 이름 설정 String
	  filePathpic = uploadPath + picimg; String filePathpic_board = uploadPath +
	  pic_boardimg;
	  
	  // 이미지 파일 저장 pic.transferTo(new File(filePathpic)); pic_board.transferTo(new
	  File(filePathpic_board));
	  
	  return "order/event-management";
	  
	  } catch (IOException e) { e.printStackTrace(); return "Error uploading file";
	  } }
	
*/
	
	private void event_img(MultipartFile pic ,MultipartFile pic_board) {
		

		System.out.println("2 - 1  if문 진입전 !!#!$!#^!%!#");
		System.out.println("pic =" + pic);
		System.out.println("pic_board =" + pic_board);
		
		/*
		 * 
		 * MultipartHttpServletRequest multipartreq = (MultipartHttpServletRequest) req;
		 * MultipartFile pic = multipartreq.getFile("pic"); MultipartFile
		 * pic_board=multipartreq.getFile("pic_board");
		 * 
		 */
	
		if(pic!= null && pic_board != null) {
			
			System.out.println("2 - 2 if문 진입 !!#!$!#^!%!#");
				  
			/* if (pic.isEmpty()) { return "No file uploaded"; } */
				  
				  System.out.println("실행ㅅ!!!"); 
				  try { 
					  // 이미지 파일을 저장할 경로 설정 
					  String uploadPath = "/dndn/resources/img/event/";
				  
				  // 업로드된 파일의 원본 이름 가져오기 
				  String picimg = pic.getOriginalFilename(); 
				  String pic_boardimg = pic_board.getOriginalFilename(); // 저장할 파일 경로와 이름 설정 
				  String filePathpic = uploadPath + picimg; 
				  String filePathpic_board = uploadPath + pic_boardimg;
				  
				  // 이미지 파일 저장 
				  pic.transferTo(new File(filePathpic)); 
				  pic_board.transferTo(new File(filePathpic_board));
	
				  
				  } 
				  	catch (IOException e) { 
				  	System.out.println("!!!");
				  		e.printStackTrace(); 
			
				  } 
		
		}
		
		}
	
	
	@PostMapping("/order/event-management")
	public void event_manegement_upload(Model model,
				HttpServletRequest request,
				String event_seq,
				boolean edit,
				MultipartFile pic,
				MultipartFile pic_board) {
	System.out.println("1번쨰 event_img() 메소드 진입전 !!#!$!#^!%!#");
	
	
	if(pic.isEmpty() && pic_board.isEmpty()) {
	  
	System.out.println("pic name = "+pic.getName()); event_img(pic,pic_board); }
	 
	System.out.println("3번쨰 event_img() 메소드 탈출 !!#!$!#^!%!#");
	
	event_manegement(model,request,event_seq,edit);
		
	}



	
	@GetMapping("/order/event-management.do")
		public String event_manegement(Model model,
				HttpServletRequest request,
				String event_seq,
				boolean edit) {
	System.out.println("1번쨰 event_img() 메소드 진입전 !!#!$!#^!%!#");
	
	/*
	 * if(pic.isEmpty() && pic_board.isEmpty()) {
	 * 
	 * System.out.println("pic name = "+pic.getName()); event_img(pic,pic_board); }
	 */
	System.out.println("3번쨰 event_img() 메소드 탈출 !!#!$!#^!%!#");


		
		System.out.println("여기로오나?");
		ArrayList<OrderEventDTO> eventlist = orderService.eventlist();

		model.addAttribute("eventlist", eventlist);

		if (event_seq != null) {

			OrderEventDTO eventdto = orderService.eventdto(event_seq);

			model.addAttribute("eventdto", eventdto);

		} else {
			OrderEventDTO eventnulldto = orderService.eventnulldto();

			model.addAttribute("eventdto", eventnulldto);

		}

		model.addAttribute("edit", edit);

		return "order/event-management";

	}

	@GetMapping("/order/stat.do")
	public String stat() {

		return "order/stat";
	}

	@GetMapping("/order/user.do")
	public String user(Model model, String user_id) {

		ArrayList<OrderDTO> userlist = orderService.userlist();

		if (user_id != null) {

			OrderDTO userdto = orderService.user(user_id);
			/*
			 * 
			 * 더미데이터 없어서 오류발생 (Cartseq 로 inner join 해야하는데 없어서 못함)
			 * 
			 * ArrayList<OrderDTO> orderlist = orderService.order(user_id);
			 * 
			 */

			model.addAttribute("userdto", userdto);
			/*
			 * 
			 * model.addAttribute("orderlist",orderlist);
			 */
		} else {
			OrderDTO userdtonull = orderService.usernull();
			model.addAttribute("userdto", userdtonull);
		}

		// System.out.println(userlist);

		model.addAttribute("userlist", userlist);

		return "order/user-management";
	}

	@GetMapping("/order/store-user.do")
	public String store(Model model, String user_id, String store_seq) {

		ArrayList<OrderDTO> userlist = orderService.storeuserlist();

		if (user_id != null) {

			OrderDTO userdto = orderService.storeuser(user_id);
			if (store_seq != null) {
				ArrayList<OrderDTO> orderlist = orderService.storeorder(store_seq);

			}
			model.addAttribute("userdto", userdto);

		}

		// System.out.println(userlist);

		model.addAttribute("userlist", userlist);

		return "order/store-management";
	}

	@GetMapping("/order/template.do")
	public String template() {

		return "order/order-template-admin";
	}

	
	@GetMapping("/order/coupon.do")
	public String coupon(Model model) {
		
		ArrayList<OrderCouponDTO> couponlist = orderService.couponlist();
		
		model.addAttribute("couponlist",couponlist);
		
		
		return "order/coupon";
	}
	
	@GetMapping("/order/coupon-edit.do")
	public String coupon_edit(Model model
			,boolean edit
			,@RequestParam(value= "name") String name
			,@RequestParam(value="sale") int sale
			,@RequestParam(value="period") int period
			,String coupon_seq ) {
	System.out.println("확인 111");
	
		
		/* System.out.println(edit); */
	
		
		
		if(edit == true) {
		
			OrderCouponDTO dto = new OrderCouponDTO();
			dto.setCouponseq(coupon_seq);
			dto.setName(name);
			dto.setSale(sale);
			dto.setPeriod(period);
		
			orderService.updatecoupon(dto);
			
			
		}
		
		
		ArrayList<OrderCouponDTO> couponlist = orderService.couponlist();
		
		model.addAttribute("couponlist",couponlist);
		
		
		return "order/coupon";
	}
	
	@GetMapping("/order/coupon-delete.do")
	public String coupon_edit(Model model,@RequestParam(value= "name") String name,@RequestParam(value="sale") int sale,@RequestParam(value="period2") int period2,boolean edit,boolean delete,boolean add,String coupon_seq) {
	System.out.println("확인 111");
	
		System.out.println(edit);
		System.out.println(delete);
		System.out.println(add);
		
		
		
		if(add == true) {
			System.out.println("확인 222");		
			OrderCouponDTO dto = new OrderCouponDTO();
			
			dto.setName(name);
			dto.setSale(sale);
			dto.setPeriod2(period2);
			
			
			orderService.insertcoupon(dto);
			
		}else if(edit == true) {
		
			OrderCouponDTO dto = new OrderCouponDTO();
			dto.setCouponseq(coupon_seq);
			dto.setName(name);
			dto.setSale(sale);
			dto.setPeriod(period);
		
			orderService.updatecoupon(dto);
			
			
		}else if(delete == true) {
		
			OrderCouponDTO dto = new OrderCouponDTO();
			
			dto.setCouponseq(coupon_seq);

		
			orderService.deletecoupon(coupon_seq);
			
		}
		
		
		ArrayList<OrderCouponDTO> couponlist = orderService.couponlist();
		
		model.addAttribute("couponlist",couponlist);
		
		
		return "order/coupon";
	}
	
	@GetMapping("/order/coupon-add.do")
	public String coupon_edit(Model model,@RequestParam(value= "name") String name,@RequestParam(value="sale") int sale,@RequestParam(value="period2") int period2,boolean add) {
	System.out.println("확인 111");
	

		System.out.println(add);
		
		
		
		if(add == true) {
			System.out.println("확인 222");		
			OrderCouponDTO dto = new OrderCouponDTO();
			
			dto.setName(name);
			dto.setSale(sale);
			dto.setPeriod2(period2);
			
			
			orderService.insertcoupon(dto);
			
		}
		
		
		ArrayList<OrderCouponDTO> couponlist = orderService.couponlist();
		
		model.addAttribute("couponlist",couponlist);
		
		
		return "order/coupon";
	}
	
	
}
