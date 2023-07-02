package com.project.dndn.lunchdetail.controller;


import com.project.dndn.lunchdetail.domain.CartDTO;
import com.project.dndn.lunchdetail.service.LunchDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.security.Principal;

@Controller
public class UserOrderController {

    // 장바구니 및 바로가기 페이지 조회
    @Autowired
    private LunchDetailService service;


    @PreAuthorize("isAuthenticated()") // 막아준다.
    @GetMapping("/userorder/usercart.do")
    public String orderCartGet(CartDTO cartDTO, String right, Model model){

        if(right.equals("right")){
            // 하나만 보낸다. > 바로 구매
            model.addAttribute("cdto",cartDTO);
        } else {
            // 장바구니에 있는거 다 보낸다. > 장바구니 보기
        }

        model.addAttribute("right", right); // 바로 구매를 구분해야 한다.
        return "userorder/usercart";
    }


    // 실제론 여기로 와야 한다.
    @PreAuthorize("isAuthenticated()") // 막아준다.
    @PostMapping("/userorder/usercart.do")
    public String orderCartPost(CartDTO cartDTO, String right, Principal principal, Model model){

        // 유저 정보 넣음
        cartDTO.setId(principal.getName());

        if(right.equals("true")){
            model.addAttribute("cdto",cartDTO);
        } else {
            // 장바구니에 있는거 다 보낸다. > 장바구니 보기
        }
        model.addAttribute("right", right); // 바로 구매를 구분해야 한다.
        return "userorder/usercart";
    }




    @GetMapping("/userorder/userorder.do")
    public String order(){
        //model.addAttribute("right", right);
        return "userorder/userorder";
    }





}
