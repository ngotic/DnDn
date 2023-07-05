package com.project.dndn.lunchdetail.controller;


import com.siot.IamportRestClient.Iamport;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Locale;

@Controller
public class PaymentController {
    private IamportClient api;

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
        System.out.println("아아아");
        System.out.println(api.paymentByImpUid(imp_uid));
        return api.paymentByImpUid(imp_uid);
    }

}
