package com.cnkrt.springbootmybatis.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class freemarkerController {
    @RequestMapping("/index")
    public String freemarker(){
        System.out.println("11");
        return "login";
    }
}
