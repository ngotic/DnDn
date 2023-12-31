package com.project.dndn.lunchdetail.controller;


import com.project.dndn.lunchdetail.domain.AddCartDTO;
import com.project.dndn.lunchdetail.domain.CartDTO;
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

    // 장바구니에 직접 추가한다.
    @PreAuthorize("isAuthenticated()") // 막아준다.
    @PostMapping("/addCart")
    public ResponseEntity<String> addCart(@RequestBody CartDTO cartDTO, Principal principal){
        try {
            cartDTO.setId(principal.getName());
            
            int result;
            
            if(cartDTO.getDayperweek()==null)
            	result = service.addCart(cartDTO);
            else 
            	result = service.addCartWithPeriodShip(cartDTO); // 정기배송 로직 
            
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
