package com.project.dndn.mypage.contoller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.dndn.lunchdetail.domain.CartDTO;
import com.project.dndn.mypage.domain.MyPageDTO;
import com.project.dndn.mypage.service.MyPageService;

@Controller
public class MyPageController {

	@Autowired
	private MyPageService myService;

	@Autowired
	private PasswordEncoder encoder;

	@PreAuthorize("isAuthenticated()")
	@GetMapping("/mypage/edit.do")
	public String edit(MyPageDTO dto, Model model, Authentication a) {

		String id = a.getName();

		System.out.println(id);

		List<MyPageDTO> list = myService.list(id);

		model.addAttribute("list", list);
		model.addAttribute("eidx", list.get(0).getEmail().indexOf("@"));
		model.addAttribute("tFidx", list.get(0).getTel().indexOf("-") + 1);
		model.addAttribute("tLidx", list.get(0).getTel().lastIndexOf("-") + 1);

		return "mypage/edit";
	}

	@PreAuthorize("isAuthenticated()")
	@PostMapping("/mypage/editok.do")
	public String editok(MyPageDTO dto, Model model, String[] telList, String[] emailList) {

		String email = emailList[0] + "@" + emailList[1];
		String tel = "010-" + telList[0] + "-" + telList[1];

		dto.setEmail(email);
		dto.setTel(tel);

		if (dto.getPw() == "" || dto.getPw() == null) {

			dto.setPw(null);
		} else {

			dto.setPw(encoder.encode(dto.getPw()));
		}

		myService.add(dto);

		return "redirect:/mypage/edit.do";
	}

	@PreAuthorize("isAuthenticated()")
	@GetMapping("/mypage/food.do")
	public String food(Model model, Authentication a) {

		String id = a.getName();

		List<MyPageDTO> Flist = myService.Flist(id);

		for (int i = 0; i < Flist.size(); i++) {

			Calendar startDate = Calendar.getInstance();

			Calendar endDate = Calendar.getInstance();
			startDate.set(Calendar.MONTH, Integer.parseInt(Flist.get(i).getStartship().substring(5, 7)) - 1);
			startDate.set(Calendar.DATE, Integer.parseInt(Flist.get(i).getStartship().substring(8, 10)));

			endDate.set(Calendar.MONTH, Integer.parseInt(Flist.get(i).getEndship().substring(5, 7)) - 1);
			endDate.set(Calendar.DATE, Integer.parseInt(Flist.get(i).getEndship().substring(8, 10)));

			String[] tempArray = (Flist.get(i).getDayperweek()).split("");

			int nowDay = (startDate.get(Calendar.DAY_OF_WEEK));

			ArrayList<String> time = new ArrayList<String>();
			int week = 7;
			Calendar foodDate = Calendar.getInstance();
			foodDate.set(Calendar.MONTH, Integer.parseInt(Flist.get(i).getStartship().substring(5, 7)) - 1);

			for (String day : tempArray) {

				int selectDay = Integer.parseInt(day);
				int serviceDay = 0;

				int mdate = (int) (((endDate.getTimeInMillis() - startDate.getTimeInMillis()) / 1000) / (24 * 60 * 60))
						+ 1;

				for (int j = 1; j <= mdate / 7; j++) {

					if (nowDay < selectDay) {

						serviceDay = Integer.parseInt(Flist.get(i).getStartship().substring(8, 10))
								+ (selectDay - nowDay);

					} else if (nowDay == selectDay) {

						serviceDay = nowDay;

					} else if (nowDay > selectDay) {

						serviceDay = Integer.parseInt(Flist.get(i).getStartship().substring(8, 10))
								+ ((week + selectDay) - nowDay);
					}

					serviceDay = serviceDay + ((j - 1) * week);

					Calendar tempDate = Calendar.getInstance();
					tempDate.set(Calendar.MONTH, Integer.parseInt(Flist.get(i).getStartship().substring(5, 7)) - 1);
					tempDate.set(Calendar.DATE, serviceDay);

					if (tempDate.getTimeInMillis() <= endDate.getTimeInMillis()) {

						foodDate.set(Calendar.DATE, serviceDay);
					}
					;

					time.add(String.format("%tF", foodDate));

				}
			}
			Flist.get(i).setResultShip(time);
			System.out.println(Flist.get(i).getShiptime() + Flist.get(i).getLunchname() + time.toString());
		}

		model.addAttribute("Flist", Flist);

		return "/mypage/food";
	}

	@PreAuthorize("isAuthenticated()")
	@GetMapping("/mypage/order.do")
	public String order(Model model, Authentication a) {

		String id = a.getName();

		Map<String, List> map = new HashMap<String, List>();

		List<MyPageDTO> Olist = myService.Olist(id);

		List<MyPageDTO> orderList = myService.orderList(id);

		map.put("Olist", Olist);
		map.put("orderList", orderList);

		model.addAttribute("map", map);

		return "/mypage/order";
	}

	@PreAuthorize("isAuthenticated()")
	@GetMapping("/mypage/fav.do")
	public String fav(Model model, Authentication a) {

		String id = a.getName();

		List<MyPageDTO> wlist = myService.wlist(id);

		model.addAttribute("wlist", wlist);

		return "/mypage/fav";
	}

	@PreAuthorize("isAuthenticated()")
	@PostMapping("/mypage/fav/{wishlistseq}/{wishsellboardseq}/{num}")
	@ResponseBody
	public int favok(@PathVariable("wishlistseq") String wishlistseq, Model model, Authentication a,
			@PathVariable("num") String num, @PathVariable("wishsellboardseq") String wishsellboardseq) {

		System.out.println("wlist");

		String id = a.getName();

		Map<String, String> map = new HashMap<String, String>();

		map.put("id", id);
		map.put("wishlistseq", wishlistseq);
		map.put("wishsellboardseq", wishsellboardseq);
		map.put("num", num);

		return myService.wdlist(map);
	}

	@PreAuthorize("isAuthenticated()")
	@GetMapping("/mypage/buylist.do")
	public String buylistGet(CartDTO cartDTO, Model model, Principal principal) {

		// 장바구니에 있는거 다 보낸다. > 장바구니 보기
		List<MyPageDTO> list = myService.listCart(principal.getName());
		model.addAttribute("list", list);

		return "/mypage/buylist";
	}

	// 실제론 여기로 와야 한다.
	@PreAuthorize("isAuthenticated()") // 막아준다.
	@PostMapping("/mypage/buylist.do")
	public String buylistPost(CartDTO cartDTO, Principal principal, Model model) {

		return "/mypage/buylist";
	}
}
