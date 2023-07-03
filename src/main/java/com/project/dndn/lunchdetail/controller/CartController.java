package com.project.dndn.lunchdetail.controller;


import com.project.dndn.lunchdetail.domain.AddCartDTO;
import com.project.dndn.lunchdetail.service.LunchDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.Principal;
import java.util.List;


// 적립 포인트는 배송비와 별도
// cart에 내용추가,
// 카트에 있는것 삭제
@Controller
@RequestMapping("/cart")
public class CartController {

    @Autowired
    private LunchDetailService service;

    @PreAuthorize("isAuthenticated()") // 막아준다.
    @PostMapping("/addCart")
    public ResponseEntity<String> addCart(@RequestBody AddCartDTO cartDTO, Principal principal){
        try {
            System.out.println("출력");
            System.out.println(cartDTO);
            cartDTO.setId(principal.getName());
            int result = service.addCart(cartDTO);
            if(result !=1){
                throw new Exception("addCart failed");
            }
            return new ResponseEntity<String>("OK", HttpStatus.OK);
        }catch (Exception e){
            e.printStackTrace();
            return new ResponseEntity<String>("ERR", HttpStatus.BAD_REQUEST);
        }
    }

    @PreAuthorize("isAuthenticated()") // 막아준다.
    @DeleteMapping ("/delCart")
    public ResponseEntity<String> delCart(@RequestBody List<String> cartseqList, Principal principal){
        try {
            System.out.println("출력 >> ");
            System.out.println(cartseqList);
            int result = service.delCart(cartseqList);
            if(result ==0){
                throw new Exception("delCart failed");
            }
            return new ResponseEntity<String>("OK", HttpStatus.OK);
        }catch (Exception e){
            e.printStackTrace();
            return new ResponseEntity<String>("ERR", HttpStatus.BAD_REQUEST);
        }
    }
}
