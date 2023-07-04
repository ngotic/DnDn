package com.project.dndn.lunchdetail.controller;


import com.project.dndn.lunchdetail.domain.WishDTO;
import com.project.dndn.lunchdetail.service.LunchDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;

@Controller
@RequestMapping("/wish")
public class WishController {

    @Autowired
    private LunchDetailService service;


    //sellboardseq:12, id:"
    @PreAuthorize("isAuthenticated()") // 막아준다.
    @PutMapping("/addorDeleteWish")
    public ResponseEntity<String> addordelWish(@RequestBody WishDTO Wish, Principal principal){

        try {

            if(Wish ==null ) throw new Exception("addorDeleteWish failed");

            System.out.println(Wish);

            int result = service.addOrDeleteWish(principal.getName(), Wish.getSellboardseq());

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
