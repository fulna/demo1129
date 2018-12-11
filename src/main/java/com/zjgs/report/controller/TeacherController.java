package com.zjgs.report.controller;

import java.io.ByteArrayOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.time.DateFormatUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.zjgs.report.model.Admin;
import com.zjgs.report.model.Report;
import com.zjgs.report.model.ReportShare;
import com.zjgs.report.model.Student;
import com.zjgs.report.model.Teacher;
import com.zjgs.report.pojo.AnalysisReport;
import com.zjgs.report.pojo.Writereport;
import com.zjgs.report.service.ReportService;
import com.zjgs.report.service.StudentService;
import com.zjgs.report.service.TeacherService;
import com.zjgs.report.util.ExportExcelUtil;
import com.zjgs.report.util.RespBody;;

@Controller
@RequestMapping("/teacher")
public class TeacherController {

	@Autowired
	private TeacherService teacherService;

	@Autowired
	private StudentService studentService;

	@Autowired
	private ReportService reportService;

	// 跳转到登录页面
	@RequestMapping("/hello")
	public String getHtml() {
		System.out.println("跳转导师登录页面");
		return "teacherLogin";
	}

	// 导师登录验证
	@RequestMapping("/login")
	public @ResponseBody RespBody<Boolean> login(HttpSession session, Teacher teacher) {
		try {
			Teacher check = teacherService.getTeacher(teacher);
			if (check == null) {
				return RespBody.fail("用户名或密码错误！");
			} else {
				session.setAttribute("tid", check.getTid());
				session.setAttribute("tname", check.getTname());
				session.setAttribute("psw", check.getPsw());
				session.setAttribute("phone", check.getPhone());
				session.setAttribute("lid", check.getLid());
				session.setAttribute("isleader", check.getIsleader());
				System.out.println("导师登录成功");
				return RespBody.success("登录成功！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return RespBody.fail("程序查找错误！");
		}
	}

	// 导师退出登录
	@RequestMapping("relogin")
	public String relogin(Model model, HttpServletRequest request) throws ServletException, IOException {
		System.out.println("到达导师退出登录");
		HttpSession session = request.getSession();
		session.removeAttribute("tid");
		session.removeAttribute("tname");
		session.removeAttribute("psw");
		session.removeAttribute("phone");
		session.removeAttribute("lid");
		session.removeAttribute("isleader");
		return "SystemLogin";
	}

	// 导师登录成功后页面跳转
	@RequestMapping("/teacherIndex")
	public String getAdminIndex() {
		System.out.println("导师成功登录页面");
		return "teacherIndex";
	}

	// 导师查看报告页面跳转
	@RequestMapping("/teacherLookReport")
	public String getteacherLookReport() {
		System.out.println("导师查看报告页面跳转");
		return "teacherLookReport";
	}

	// 导师添加导师页面跳转
	@RequestMapping("/teacherAddTeacher")
	public String getteacherAddTeacher() {
		System.out.println("导师添加导师页面跳转");
		return "teacherAddTeacher";
	}

	// 导师添加学生页面跳转
	@RequestMapping("/teacherAddStudent")
	public String getteacherAddStudent() {
		System.out.println("导师添加导师页面跳转");
		return "teacherAddStudent";
	}

	// 导师查看报告统计页面跳转
	@RequestMapping("/teacherCountReport")
	public String getteacherCountStudent() {
		System.out.println("导师查看报告统计页面跳转");
		return "teacherCountReport";
	}

	// 导师查看学生报告列表页面跳转
	@RequestMapping("/teacherLookStudentReportList")
	public String getteacherLookStudentReportList() {
		System.out.println("导师查看学生报告列表页面跳转");
		return "teacherLookStudentReportList";
	}

	// 导师查看实验室报告列表页面跳转
	@RequestMapping("/teacherLookLabReportList")
	public String teacherLookLabReportList() {
		System.out.println("导师查看实验室报告列表页面跳转");
		return "teacherLookLabReportList";
	}

	// 导师导出学生报告列表页面跳转
	@RequestMapping("/teacherExportReportList")
	public String teacherExportReportList() {
		System.out.println("导师导出学生报告列表页面跳转");
		return "teacherExportReportList";
	}
	
	// 导师查看实验室导师列表页面跳转
	@RequestMapping("/teacherLookTeacherList")
	public String teacherLookTeacherList() {
		System.out.println("导师查看实验室导师列表页面跳转");
		return "teacherLookTeacherList";
	}
	
	
	// 导师查看学生列表页面跳转
	@RequestMapping("/teacherLookStudentList")
	public String teacherLookStudentList() {
		System.out.println("导师查看学生列表页面跳转");
		return "teacherLookStudentList";
	}

	// 负责人添加导师
	@RequestMapping("/addTeacher")
	public @ResponseBody RespBody<Boolean> AddTeacher(HttpSession session, Teacher teacher) {
		try {

			teacherService.saveTeacher(teacher);
			return RespBody.success("导师添加成功！");

		} catch (Exception e) {
			e.printStackTrace();
			return RespBody.fail("导师添加失败！");
		}
	}

	// 导师添加学生
	@RequestMapping("/addStudent")
	public @ResponseBody RespBody<Boolean> AddStudent(HttpSession session, Student student) {
		try {
			studentService.saveStudent(student);
			return RespBody.success("学生添加成功！");

		} catch (Exception e) {
			e.printStackTrace();
			return RespBody.fail("学生添加失败！");
		}
	}

	// 导师统计报告数据
	@RequestMapping("/countReport")
	public @ResponseBody List<AnalysisReport> CountReport(HttpSession session, AnalysisReport analysisreport) {
		List<AnalysisReport> list = reportService.analysisReport();
		return list;
	}

	// 导师通过列表得报告详细信息
	@ResponseBody
	@RequestMapping(value = "/teacherGetReportByRid")
	public Writereport teacherGetReportByRid(HttpSession session, Report report) {
		System.out.println("导师通过列表得报告详细信息");
		Writereport writereport = reportService.lookOneStudentReport(report);
		session.setAttribute("curRid", writereport.getRid());
		return writereport;
	}
	// 导师导出报告
	@RequestMapping("/teacherExportReportByRid")
		  		public @ResponseBody RespBody<Boolean> teacherExportReportByRid(HttpServletRequest request,HttpServletResponse response,Report report){				
		  				System.out.println("导师通过列表得报告详细信息");
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


	// 导师获得学生报告列表信息
	@SuppressWarnings("unchecked")
	@RequestMapping("/lookreportlist")
	public @ResponseBody <T> RespBody<T> lookreportlist(HttpSession session) {
		System.out.println("导师获得学生报告列表信息");
		int tid = (int) session.getAttribute("tid");
		List<Report> rl = reportService.lookReportlist(tid);
		return (RespBody<T>) RespBody.success(rl);
	}
/*	// 导师获得导师列表信息
	@SuppressWarnings("unchecked")
	@RequestMapping("/getTeacherlist")
	public @ResponseBody <T> RespBody<T> getTeacherlist(HttpSession session) {
		System.out.println("导师获得学生报告列表信息");
		int tid = (int) session.getAttribute("tid");
		List<Teacher> tl = teacherService.getTeacherlist();
		return (RespBody<T>) RespBody.success(tl);
	}*/

	// 导师获得实验室报告列表信息
	@SuppressWarnings("unchecked")
	@RequestMapping("/looklabreportlist")
	public @ResponseBody <T> RespBody<T> looklabreportlist(HttpSession session) {
		System.out.println("导师获得实验室报告列表信息");
		int lid = (int) session.getAttribute("lid");
		List<Report> rl = reportService.lookLabReportlist(lid);
		return (RespBody<T>) RespBody.success(rl);
	}

	// 导师评论报告
	@RequestMapping("/commentReportByRid")
	public @ResponseBody RespBody<Boolean> commentReportByRid(HttpSession session, Report report) {
		try {
			String rid = (String) session.getAttribute("curRid");
			report.setRid(rid);
			reportService.teacherCommentReport(report);
			System.out.println("导师评论");
			return RespBody.success("评论成功！");
		} catch (Exception e) {
			e.printStackTrace();
			return RespBody.fail("评论失败！");
		}
	}

	// 导师查看分享报告页面跳转
	@RequestMapping("/teacherLookShareReportList")
	public String teacherLookShareReportList() {
		System.out.println("导师查看分享页面");
		return "teacherLookShareReportList";
	}

	// 老师跳转到查看分享报告页面server 要求老师登录时将老师的信息存在bean中
	@SuppressWarnings("unchecked")
	@RequestMapping("/tlooksharereportlist")
	public @ResponseBody <T> RespBody<T> teacherlooksharereportlist(HttpSession session) {
		System.out.println("老师跳转到查看分享报告页面");
		// teacher.setTid(1002);
		// System.out.println(teacher.getTid());
		int tid=(int)session.getAttribute("tid");
		List<ReportShare> rl = reportService.tlookShareReportlist(tid);
		System.out.println("老师跳转到查看分享报告页面chenggong");
		return (RespBody<T>) RespBody.success(rl);
	}

	// 老师通过分享列表得报告详细信息 setThistask setThisproblem setNextplan
	@ResponseBody
	@RequestMapping(value = "/teacherGetShareReportByRid")
	public Writereport teacherGetShareReportByRid(ReportShare reportshare) {
		System.out.println("老师通过分享列表得报告详细信息");
		Writereport writereport = reportService.lookOneShareReport(reportshare);
		return writereport;
	}

	// 老师通过列表分享此份报告
	@ResponseBody
	@RequestMapping(value = "/teacherShareReportto")
	public void teachershareReportByRid(Report report, String ID, Teacher teacher) {
		System.out.println("老师通过分享列表得报告详细信息");
		reportService.teacherShareReport(report, ID, teacher);

	}
	
    //导师获取实验室导师列表数据并返回到页面	    
    @SuppressWarnings("unchecked")
	@RequestMapping("/getLookTeacherList")
    public @ResponseBody  <T> RespBody<T>  getLookTeacherList(HttpSession session){	    	
    	int lead=0;         //不是实验室负责人导师的islead字段的值是0
    	int lid = (int) session.getAttribute("lid");
    	List<Teacher> list=teacherService.selectTeacherByLeadAndLid(lead,lid);	    	
        System.out.println("导师获取实验室导师列表数据并返回到页面");
        return (RespBody<T>) RespBody.success(list);
    }
    
    //导师获取学生列表数据并返回到页面	    
    @SuppressWarnings("unchecked")
	@RequestMapping("/getLookStudentList")
    public @ResponseBody  <T> RespBody<T>  getLookStudentList(HttpSession session){	    	
    	int tid = (int) session.getAttribute("tid");
    	List<Student> list=studentService.selectStudentByLeadAndLid(tid);	    	
        System.out.println("导师获取学生列表数据并返回到页面");
        return (RespBody<T>) RespBody.success(list);
    }
    
	//导师删除学生
	@RequestMapping("/teacherDeleteStudent")
	public @ResponseBody RespBody<Boolean> teacherDeleteStudent(HttpSession session,Student student){		
		try {
			studentService.teacherDeleteStudent(student);
			return RespBody.success("删除学生成功！");							
		} catch (Exception e) {
			e.printStackTrace();
			return RespBody.fail("删除学生失败！");
		}
	}

	
	//导师修改学生密码		
	@RequestMapping("editStudentPsw")
	public @ResponseBody RespBody<Boolean> editStudentPsw(Student student){		
		try {
			studentService.teacherEditStudentPsw(student);
			return RespBody.success("密码修改成功！");
		} catch (Exception e) {
			e.printStackTrace();
			return RespBody.fail("密码修改失败！");
	}
}
	//导师修改学生手机号码		
	@RequestMapping("editStudentPhone")
	public @ResponseBody RespBody<Boolean> editStudentPhone(Student student){		
		try {
			studentService.teacherEditStudentPhone(student);
			return RespBody.success("手机号码修改成功！");
		} catch (Exception e) {
			e.printStackTrace();
			return RespBody.fail("手机号码修改失败！");
	}
}
	//导师获得学生详细信息
	@ResponseBody
	@RequestMapping(value = "/teacherGetStudentByTid")
	public  Student teacherGetStudentByTid(Student student){
		System.out.println("导师获得学生详细信息");		
		return student;	
	}
	
	//获得当前分享报告的Rid
	@ResponseBody
	@RequestMapping(value = "/getShareReportRid")
	public  Report getShareReportRid(HttpSession session,Report report){
		System.out.println("获得当前分享报告的Rid");
		session.setAttribute("rid", report.getRid());
		return report;	
	}
		
	
	  //导师分享报告页面跳转
    @RequestMapping("/teacherShareReport")
    public String getteacherShareReport(){
    	System.out.println("导师分享报告页面跳转");
        return "teacherShareReport";
    }
    
    //导师获得分享给学生的名单
	    @SuppressWarnings("unchecked")
	    @RequestMapping("/getStudentListname")
	    public @ResponseBody  <T> RespBody<T>  getStudentListname(HttpSession session){	    
	    	System.out.println("导师获得分享给学生的名单");
		    System.out.println("查询学生名字");
		    int rsfrompersonid =(int) session.getAttribute("tid");
		    List<String> list1 = studentService.getAllName(rsfrompersonid);
		    System.out.println("查询到了学生名字");
	        return (RespBody<T>) RespBody.success(list1);
	  }
	    //导师获得分享给导师的名单
	    @SuppressWarnings("unchecked")
	    @RequestMapping("/getTeacherListname")
	    public @ResponseBody  <T> RespBody<T>  getTeacherListname(HttpSession session){	
	    	System.out.println("导师获得分享给导师的名单");
	    	System.out.println("查询导师名字");	    
	    	String tname = (String) session.getAttribute("tname");
		    List<String> list1 = teacherService.getAllName(tname);		    
		    System.out.println("查询到了导师名字");
	        return (RespBody<T>) RespBody.success(list1);
	    }
	    
	    
	    // 存储分享给学生的信息
	    @RequestMapping("/shareInformationStoreToStudent") 		
  		public  @ResponseBody  <T> RespBody<T>  shareReportToStudent(HttpSession session,Student student){ 		
	    	System.out.println("存储分享给学生的信息");
	    	try {
				String rid = (String) session.getAttribute("rid");
  				int rsfrompersonid =(int) session.getAttribute("tid");//RSFromPersonId,RSToPersonId
  	  			int rstopersonid  = studentService.findSidBySname(student.getSname());
  	  			reportService.storeShareSInformation(rid,rstopersonid,rsfrompersonid);
  	  			return  RespBody.success("分享成功！");  	  			
  			} catch (Exception e) {
  				e.printStackTrace();
  				return RespBody.fail("分享失败！");
  			}
  		}
	 	    
	    
	    // 存储分享给导师的信息
	    @RequestMapping("/shareInformationStoreToTeacher") 		
  		public  @ResponseBody  <T> RespBody<T>  shareReportToTeacher(HttpSession session,Teacher teacher){ 		
	    	System.out.println("存储分享给导师的信息");
	    	try {				
	    		String rid = (String) session.getAttribute("rid");
  				int rsfrompersonid =(int) session.getAttribute("tid");//RSFromPersonId,RSToPersonId
  	  			int rstopersonid  = teacherService.findSidByTname(teacher.getTname());
  	  			reportService.storeShareTInformation(rid,rstopersonid,rsfrompersonid);
	    		
  	  			return  RespBody.success("分享成功！");  	  			
  			} catch (Exception e) {
  				e.printStackTrace();
  				return RespBody.fail("分享失败！");
  			}
  		}
	    

}
