package com.project.dndn.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ListController {
    @GetMapping("/list.do")
    public String template() {
        return "item/list";
    }
}

