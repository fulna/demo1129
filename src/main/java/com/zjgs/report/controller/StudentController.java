package com.zjgs.report.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.zjgs.report.model.Admin;
import com.zjgs.report.model.Lab;
import com.zjgs.report.model.Report;
import com.zjgs.report.model.ReportShare;
import com.zjgs.report.model.Student;
import com.zjgs.report.pojo.Writereport;
import com.zjgs.report.service.StudentService;
import com.zjgs.report.service.LabService;
import com.zjgs.report.service.ReportService;
import com.zjgs.report.util.ExportExcelUtil;
import com.zjgs.report.util.RespBody;;
@Controller
@RequestMapping("/student")
public class StudentController {
    
    @Autowired
    private StudentService studentService;
    
    @Autowired
    private ReportService reportService;
    
    @Autowired
    private LabService labService;
    
	    //跳转到登录页面
	    @RequestMapping("/hello")
	    public String getHtml(){
	    	System.out.println("跳转学生登录页面");
	        return "studentLogin";
	    }
    	
		//学生登录验证
		@RequestMapping("/login")
		public @ResponseBody RespBody<Boolean> login(HttpSession session,Student student){		
			try {
				Student check=studentService.getStudent(student);
				if(check==null){					
					return RespBody.fail("用户名或密码错误！");
				}else{					
					session.setAttribute("sid",check.getSid());
					session.setAttribute("sname",check.getSname());
					session.setAttribute("psw",check.getPsw());
					session.setAttribute("phone",check.getPhone());
					session.setAttribute("tid",check.getTid());
					session.setAttribute("lid",check.getLid());
					System.out.println("学生登录成功");
					return RespBody.success("登录成功！");
				}			
			} catch (Exception e) {
				e.printStackTrace();
				return RespBody.fail("程序查找错误！");
			}
		}
		//学生退出登录
		@RequestMapping("relogin")
		public String relogin(Model model,HttpServletRequest request) throws ServletException, IOException{
			System.out.println("到达usercontroller" );
			HttpSession session = request.getSession(); 
			session.removeAttribute("sid");   
			session.removeAttribute("sname");   
			session.removeAttribute("psw");  
			session.removeAttribute("phone");   
			session.removeAttribute("tid");   
			session.removeAttribute("lid");  
			return "SystemLogin";    		
		}
	    //学生登录成功后页面跳转
	    @RequestMapping("/studentIndex")
	    public String getstudentIndex(){
	    	System.out.println("学生成功登录页面");
	        return "studentIndex";
	    }
	    //学生跳转到填写报告页面
	    @RequestMapping("studentWriteReport")
	    public String getstudentWriteReport(){
	    	System.out.println("学生跳转到填写报告页面");
	        return "studentWriteReport";
	    }
	    //学生跳转到查看报告页面
	    @RequestMapping("/studentLookReport")
	    public String getstudentLookReport(){
	    	System.out.println("学生跳转到查看报告页面");
	        return "studentLookReport";
	    }
	    
		//学生提交报告
		@RequestMapping("/writereport")
		public @ResponseBody RespBody<Boolean> writereport(HttpSession session,Writereport writereport){		
			try {
				System.out.println("学生提交报告");
				
				int sid =(int) session.getAttribute("sid");
				String name =(String) session.getAttribute("sname");
				int lid =(int) session.getAttribute("lid");
				int tid =(int) session.getAttribute("tid");
				writereport.setTid(tid);
				writereport.setLid(lid);
				writereport.setSid(sid);
				writereport.setSname(name);
				reportService.saveReport(writereport);
				return RespBody.success("报告保存成功！");
				
			} catch (Exception e) {
				e.printStackTrace();
				return RespBody.fail("报告保存失败！");
			}
		}
		
	    //学生跳转到查看报告列表页面
	    @RequestMapping("/studentLookReportList")
	    public String studentLookReportList(){
	    	System.out.println("学生跳转到查看报告列表页面");
	        return "studentLookReportList";
	    }
	    
	    //学生查看自己的报告列表页面
	    @RequestMapping("/studentLookMyReportList")
	    public String studentLookMyReportList(){
	    	System.out.println("学生跳转到查看自己报告列表页面");
	        return "studentLookMyReportList";
	    }
	    
		//学生获得自己报告列表信息
	    @SuppressWarnings("unchecked")
	    @RequestMapping("/lookreportlist")
	    public @ResponseBody  <T> RespBody<T>  lookreportlist(HttpSession session){
	    	 System.out.println("学生获得自己报告列表信息");
	    	int sid =(int) session.getAttribute("sid");
	    	List<Report> rl=reportService.studentlookMyReportlist(sid);	    	
	        return (RespBody<T>) RespBody.success(rl);
	    }
	    
		//学生通过列表获得报告详细信息
		@ResponseBody
		@RequestMapping(value = "/studentGetReportByRid")
		public  Writereport teacherGetReportByRid(Report report){
			System.out.println("学生通过列表获得自己报告详细信息");
			Writereport writereport=reportService.lookOneStudentReport(report);
			return writereport;	
		}
		//学生获得上一份报告报告详细信息
		@ResponseBody
		@RequestMapping(value = "/studentGetLastReport")
		public  Writereport studentGetLastReport(HttpSession session){
			System.out.println("学生通过列表获得自己报告详细信息");
			int sid =(int) session.getAttribute("sid");
			Writereport writereport=reportService.studentGetLastReport(sid);
			return writereport;	
		}
		
	    //学生查看是实验室报告列表页面
	    @RequestMapping("/studentLookLabReportList")
	    public String studentLookLabReportList(){
	    	System.out.println("学生跳转到查看实验室报告列表页面");
	        return "studentLookLabReportList";
	    }
	    
		//学生获得实验室报告列表信息
	    @SuppressWarnings("unchecked")
	    @RequestMapping("/looklabreportlist")
	    public @ResponseBody  <T> RespBody<T>  looklabreportlist(HttpSession session){
	    	 System.out.println("学生获得实验室报告列表信息");
	    	int lid =(int) session.getAttribute("lid");
	    	List<Report> rl=reportService.lookLabReportlist(lid);	    	
	        return (RespBody<T>) RespBody.success(rl);
	    }
	    
	    //学生跳转到查看分享报告页面
	    @RequestMapping("/studentLookShareReportList") 
	    public String getstudentLookShareReport(){
	    	System.out.println("学生跳转到查看分享报告页面");
	        return "studentLookShareReportList";
	    }
	    
	  
	  //学生跳转到查看分享报告页面server 要求学生登录时将学生的信息存在bean中
	    @SuppressWarnings("unchecked")
	    @RequestMapping("/looksharereportlist")
	    public @ResponseBody  <T> RespBody<T>  studentlooksharereportlist(HttpSession session){
	    	
	    	System.out.println("学生跳转到查看分享报告页面");
	    	int sid=(int)session.getAttribute("sid");
	    	List<ReportShare> rl=reportService.tlookShareReportlist(sid);
	    	System.out.println("学生跳转到查看分享报告页面成功");
	        return (RespBody<T>) RespBody.success(rl);
	    }
	    
	  //学生通过分享列表得报告详细信息 setThistask setThisproblem setNextplan
	  		@ResponseBody
	  		@RequestMapping(value = "/studentGetShareReportByRid")
	  		public  Writereport teacherGetReportByRid(ReportShare reportshare){
	  			System.out.println("学生通过分享列表得报告详细信息");
	  			Writereport writereport=reportService.lookOneShareReport(reportshare);
	  			return writereport;	
	  		}  

	  		// 学生导出报告
	  		@RequestMapping("/studentExportReportByRid")
	  			  		public @ResponseBody RespBody<Boolean> studentExportReportByRid(HttpServletRequest request,HttpServletResponse response,Report report){				
	  			  				System.out.println("学生导出报告");
	  			  		try{
	  			  			ExportExcelUtil<Writereport> util = new ExportExcelUtil<Writereport>();
	  			  			 // 准备数据
	  			  			Writereport writereport = reportService.lookOneStudentReport(report);
	  			  			List<Writereport> list = new ArrayList<Writereport>();
	  		  				list.add(writereport);
	  			  	        String[] columnNames = { "报告编号","学号","姓名","上周计划","上周困难","本周完成情况","本周困困难","下周计划","导师评分","导师评语"};
	  			  	        String reportname=writereport.getRid();
	  			  	        util.exportExcel("用户导出", columnNames, list, new FileOutputStream("D:/"+reportname+".xls"), ExportExcelUtil.EXCEL_FILE_2003);

	  			  				 return RespBody.success("导出报告成功！");	  				
	  			  			} catch (Exception e) {
	  			  				e.printStackTrace();
	  			  				return RespBody.fail("导出报告失败！");
	  			  			}
	  			  			
	  			  		}
	  		
	  		
	  	
	  		
	  	
}