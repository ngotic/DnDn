package com.project.dndn.lunchdetail.controller;


import com.project.dndn.lunchdetail.domain.CartDTO;
import com.project.dndn.lunchdetail.domain.WishDTO;
import com.project.dndn.lunchdetail.service.LunchDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.Principal;


// 적립 포인트는 배송비와 별도
// cart에 내용추가,
// 카트에 있는것 삭제
@Controller
@RequestMapping("/cart")
public class CartController {


    @Autowired
    private LunchDetailService service;

    @PreAuthorize("isAuthenticated()") // 막아준다.
    @PutMapping("/addCart")
    public ResponseEntity<String> addCart(@RequestBody CartDTO cartdto, Principal principal){

        try {

            if(cartdto ==null ) throw new Exception("addCart failed");
            System.out.println(cartdto);
            int result = service.addCart(cartdto);

            if(result !=1){
                throw new Exception("addorDeleteWish failed");
            }
            return new ResponseEntity<String>("OK", HttpStatus.OK);
        }catch (Exception e){
            e.printStackTrace();
            return new ResponseEntity<String>("ERR", HttpStatus.BAD_REQUEST);
        }

    }

}
