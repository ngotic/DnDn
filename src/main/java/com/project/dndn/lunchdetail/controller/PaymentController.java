package com.project.dndn.lunchdetail.controller;


import com.project.dndn.lunchdetail.domain.OrderDTO;
import com.project.dndn.lunchdetail.domain.WishDTO;
import com.project.dndn.lunchdetail.service.LunchDetailService;
import com.siot.IamportRestClient.Iamport;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.security.Principal;
import java.util.Locale;

@Controller
public class PaymentController {

    private IamportClient api;

    @Autowired
    private LunchDetailService service;
    public PaymentController() {
        // REST API 키와 REST API secret 를 아래처럼 순서대로 입력한다.
        this.api = new IamportClient("4726501750328654","bagG9YiACmNU2QxgMaHPTQJuSzzImZxt7EDz1YAbAIDAfJkRgi8KrTYW1CkvMbU7vqNKIqK3oZxVCCB8");
    }

    @ResponseBody
    @RequestMapping(value="/verifyIamport/{imp_uid}", method = RequestMethod.POST)
    public IamportResponse<Payment> paymentByImpUid(
            Model model
            , Locale locale
            , HttpSession session
            , @PathVariable(value= "imp_uid") String imp_uid) throws IamportResponseException, IOException
    {
        System.out.println(api.paymentByImpUid(imp_uid));
        return api.paymentByImpUid(imp_uid);
    }


    @PreAuthorize("isAuthenticated()") // 막아준다.
    @PostMapping("/order/addOrder")
    public ResponseEntity<String> addorder(@RequestBody OrderDTO order, Principal principal){

        try {

            System.out.println(">>>>"+order);

            int result = service.orderTransaction(order);

            if(result == 0 ) throw new Exception("addorder failed");
            return new ResponseEntity<String>("OK", HttpStatus.OK);

        }catch (Exception e){
            e.printStackTrace();
            return new ResponseEntity<String>("ERR", HttpStatus.BAD_REQUEST);
        }
    }


}
