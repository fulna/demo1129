package com.zjgs.report.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.zjgs.report.model.Admin;
import com.zjgs.report.model.Lab;
import com.zjgs.report.model.Teacher;
import com.zjgs.report.service.AdminService;
import com.zjgs.report.service.LabService;
import com.zjgs.report.service.TeacherService;
import com.zjgs.report.util.RespBody;



@Controller
@RequestMapping("/admin")
public class AdminController {
    
    @Autowired
    private AdminService adminService;
    
    @Autowired
    private TeacherService teacherService;
    
    @Autowired
    private LabService labService;
     
    //跳转到登录页面
    @RequestMapping("/hello")
    public String getHtml(){
    	System.out.println("跳转到管理员登录页面");
        return "adminLogin";
    }

	//管理员登录验证
	@RequestMapping("/login")
	public @ResponseBody RespBody<Boolean> login(HttpSession session,Admin admin){		
		try {
			Admin check=adminService.getAdmin(admin);
			if(check==null){
				return RespBody.fail("用户名或密码错误！");
			}else{
				return RespBody.success("登录成功！");
			}			
		} catch (Exception e) {
			e.printStackTrace();
			return RespBody.fail("程序查找错误！");
		}
	}
	//管理员退出登录
		@RequestMapping("relogin")
		public String relogin(Model model,HttpServletRequest request) throws ServletException, IOException{
			System.out.println("到达usercontroller" );
			HttpSession session = request.getSession(); 
			session.removeAttribute("AdminName");   
			session.removeAttribute("AdminSuper");   
			session.removeAttribute("AdminSign");  
			session.removeAttribute("AdminReal");   
			session.removeAttribute("AdminMarry");   
			session.removeAttribute("AdminUser");  
			session.removeAttribute("AdminData");   
			session.removeAttribute("AdminRole");  
			return "SystemLogin";    //显示用户信息		
		}
		
	    //管理员登录成功后页面跳转
	    @RequestMapping("/adminIndex")
	    public String getAdminIndex(){
	    	System.out.println("aaaaaaaa3333");
	        return "adminIndex";
	    }
	    
	    //管理员跳转到添加实验室页面
	    @RequestMapping("/adminAddLab")
	    public String getadminAddLab(){
	    	System.out.println("管理员跳转到添加实验室页面");
	        return "adminAddLab";
	    }
	    
	    //管理员跳转到查看实验室页面
	    @RequestMapping("/adminLookLab")
	    public String getadminLookLab(){
	    	System.out.println("管理员跳转到查看实验室页面");
	        return "adminLookLab";
	    }
	    
	    //管理员跳转到添加老师页面
	    @RequestMapping("/adminAddTeacher")
	    public String getadminAddTeacher(){
	    	System.out.println("管理员跳转到添加老师页面");
	        return "adminAddTeacher";
	    }
	    
	    //管理员跳转到查看导师列表页面
	    @RequestMapping("/adminLookTeacherList")
	    public String adminLookTeacherList(){
	    	System.out.println("管理员跳转到查看导师列表页面");
	        return "adminLookTeacherList";
	    }
	    
	    //管理员获取导师列表数据并返回到页面	    
	    @SuppressWarnings("unchecked")
		@RequestMapping("/getLookTeacherList")
	    public @ResponseBody  <T> RespBody<T>  getLookTeacherList(){	    	
	    	int lead=1;         //实验室负责人导师的islead字段的值是1
	    	List<Teacher> list=teacherService.selectLeaderTeacher(lead);	    	
	        System.out.println("管理员获取导师列表数据并返回到页面");
	        return (RespBody<T>) RespBody.success(list);
	    }
	    
		//管理员删除实验室负责人
		@RequestMapping("/adminDeleteTeacher")
		public @ResponseBody RespBody<Boolean> adminDeleteTeacher(HttpSession session,Teacher teacher){		
			try {
				teacherService.adminDeleteTeacher(teacher);
				return RespBody.success("实验室负责人删除成功！");							
			} catch (Exception e) {
				e.printStackTrace();
				return RespBody.fail("实验室负责人删除失败！");
			}
		}

		
		//管理员修改实验室负责人密码		
		@RequestMapping("editTeacherPsw")
		public @ResponseBody RespBody<Boolean> editTeacherPsw(Teacher teacher){		
			try {
				teacherService.adminEditTeacherPsw(teacher);
				return RespBody.success("密码修改成功！");
			} catch (Exception e) {
				e.printStackTrace();
				return RespBody.fail("密码修改失败！");
		}
	}
		//管理员修改实验室负责人手机号码		
		@RequestMapping("editTeacherPhone")
		public @ResponseBody RespBody<Boolean> editTeacherPhone(Teacher teacher){		
			try {
				teacherService.adminEditTeacherPhone(teacher);
				return RespBody.success("手机号码修改成功！");
			} catch (Exception e) {
				e.printStackTrace();
				return RespBody.fail("手机号码修改失败！");
		}
	}
		//管理员获得实验室负责人详细信息
		@ResponseBody
		@RequestMapping(value = "/adminGetTeacherByTid")
		public  Teacher adminGetTeacherByTid(Teacher teacher){
			System.out.println("管理员获得实验室负责人详细信息");
			
			return teacher;	
		}
		
	    //管理员跳转到查看实验室列表页面
	    @RequestMapping("/adminLookLabList")
	    public String adminLookLabList(){
	    	System.out.println("管理员跳转到查看实验室列表页面");
	        return "adminLookLabList";
	    }
	    
	    //管理员获取导师列表数据并返回到页面	    
	    @SuppressWarnings("unchecked")
		@RequestMapping("/getLookLabList")
	    public @ResponseBody  <T> RespBody<T>  getLookLabList(){	    	
	    
	    	List<Lab> list=labService.selectLabList();	
	        System.out.println("管理员获取导师列表数据并返回到页面	");
	        return (RespBody<T>) RespBody.success(list);
	    }
	    
		//管理员获得实验室详细信息
		@ResponseBody
		@RequestMapping(value = "/adminGetLabByLid")
		public  Lab adminGetLabByLid(Lab lab){
			System.out.println("管理员获得实验室负责人详细信息");			
			return lab;	
		}
		//管理员删除实验室
		@RequestMapping("/adminDeleteLab")
		public @ResponseBody RespBody<Boolean> adminDeleteLab(HttpSession session,Lab lab){		
			try {
				labService.adminDeleteLabByLid(lab);
				return RespBody.success("实验室删除成功！");							
			} catch (Exception e) {
				e.printStackTrace();
				return RespBody.fail("实验室删除失败！");
			}
		}
		//管理员修改实验室方向	
		@RequestMapping("editLabContent")
		public @ResponseBody RespBody<Boolean> editLabContent(Lab lab){		
			try {
				labService.adminEditLabContent(lab);
				return RespBody.success("实验室方向修改成功！");
			} catch (Exception e) {
				e.printStackTrace();
				return RespBody.fail("实验室方向修改失败！");
		}
	}
		//管理员修改实验室负责人	
		@RequestMapping("editLabTeacher")
		public @ResponseBody RespBody<Boolean> editLabTeacher(Lab lab){		
			try {
				labService.adminEditLabTeacher(lab);
				return RespBody.success("实验室负责人修改成功！");
			} catch (Exception e) {
				e.printStackTrace();
				return RespBody.fail("实验室负责人修改失败！");
		}
	}
		//管理员添加实验室
		@RequestMapping("/saveAdminAddLab")  
	     public @ResponseBody RespBody<Boolean> saveAdminAddLab(HttpSession session,Lab lab){
	         try {
			      labService.saveLab(lab);
			      return RespBody.success("实验室添加成功！");
	      
	         } catch (Exception e) {
	        	 e.printStackTrace();
	        	 return RespBody.fail("实验室添加失败！");
	         }
	     }
		
		//管理员添加老师
	    @RequestMapping("/saveAdminAddTeacher")
	    public @ResponseBody RespBody<Boolean> saveAdminAddTeacher(HttpSession session,Teacher teacher){
	        try {
  				teacherService.adminSaveTeacher(teacher);
  				return RespBody.success("教师添加成功！");
  				
  			} catch (Exception e) {
  				e.printStackTrace();
  				return RespBody.fail("教师添加失败！");
  			}
	    }
}
