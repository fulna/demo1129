package com.zjgs.report.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;





@Controller
public class SystemController {
   
    //系统登录页面
    @RequestMapping("/")
    public String getHtml(){
    	System.out.println("跳转到系统登录页面");
        return "SystemLogin";
    }


}
