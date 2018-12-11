package com.zjgs.report.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.zjgs.report.model.Admin;
import com.zjgs.report.service.AdminService;
import com.zjgs.report.util.RespBody;;
@Controller
@RequestMapping("/report")
public class ReportController {
    
    @Autowired
    private AdminService adminService;
    
    //登录页面
    @RequestMapping("/hello")
    public String getHtml(){
    	System.out.println("aaaaaaaa222222222");
        return "adminLogin";
    }

	//管理员登录验证
	@RequestMapping("/login")
	public @ResponseBody RespBody<Boolean> login(HttpSession session,Admin admin){		
		try {
			Admin list=adminService.getAdmin(admin);
			if(list==null){
				return RespBody.fail("用户名或密码错误！");
			}else{
				return RespBody.success("登录成功！");
			}			
		} catch (Exception e) {
			e.printStackTrace();
			return RespBody.fail("程序查找错误！");
	}
}
}
