package com.project.dndn.lunchdetail.controller;


import com.project.dndn.lunchdetail.domain.AddCartDTO;
import com.project.dndn.lunchdetail.domain.CartDTO;
import com.project.dndn.lunchdetail.domain.CouponDTO;
import com.project.dndn.lunchdetail.service.LunchDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
public class UserOrderController {

    // 장바구니 및 바로가기 페이지 조회
    @Autowired
    private LunchDetailService service;

    @PreAuthorize("isAuthenticated()") // 막아준다.
    @GetMapping("/userorder/usercart.do")
    public String orderCartGet(CartDTO cartDTO, String right, Model model, Principal principal){
        
        if(right.equals("true")){
            List<CartDTO> list = new ArrayList<CartDTO>();
            list.add(cartDTO);
            model.addAttribute("list",list);
        } else {
            // 장바구니에 있는거 다 보낸다. > 장바구니 보기
            List<CartDTO> list = service.listCart(principal.getName());
            model.addAttribute("list",list);
        }
        model.addAttribute("right", right); // 바로 구매를 구분해야 한다.
        return "userorder/usercart";
    }

    // 바로 구매시에 장바구니에 추가
    @PreAuthorize("isAuthenticated()") // 막아준다.
    @PostMapping("/userorder/usercart.do")
    public String orderCartPost(CartDTO cartDTO, String right, Principal principal, Model model){
        // 유저 정보 넣음
        cartDTO.setId(principal.getName());
        System.out.println("------>"+cartDTO);
        if(right.equals("true")){
            String id = principal.getName();
            List<CartDTO> list = new ArrayList<CartDTO>();
            AddCartDTO addcartDto = new AddCartDTO();
            addcartDto.setId(id);
            addcartDto.setSellboardseq(cartDTO.getSellboardseq());
            addcartDto.setStoreseq(cartDTO.getStoreseq());
            addcartDto.setCnt(cartDTO.getCnt());
            int result = service.addCart(addcartDto);
            String cartseq = service.maxCartseq(id);
            list.add(cartDTO);
            model.addAttribute("cartseq",cartseq);
            model.addAttribute("list",list);
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


    @PreAuthorize("isAuthenticated()")
    @PostMapping("/userorder/userorder.do")
    public String order(String[] cartseq, Model model, Principal principal){

        for( String a : cartseq)
            System.out.println(a);


        List<String> cartList = Arrays.asList(cartseq);
        // 1. 주문하는 장바구니 품목 가져오기
        List<CartDTO> clist = service.orderCartList(principal.getName(), cartList);
        // 2. 유저가 보유한 쿠폰 가져오기 > 가져올 때 isuse가 F인 것만 가져온다.
        List<CouponDTO> coulist = service.getUserCouponList(principal.getName());// 안쓴거만
        // 3. 진행중인 이벤트 검색 > 서버단에서 로직 있고 ~~~ 해당되면 프론트단으로 뿌려준다.
        int point = service.getUserPoint(principal.getName());

        model.addAttribute("point", point);
        model.addAttribute("clist", clist);
        model.addAttribute("coulist", coulist);

        return "userorder/userorder";
    }


}
