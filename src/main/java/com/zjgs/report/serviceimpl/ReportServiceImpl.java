package com.zjgs.report.serviceimpl;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zjgs.report.repository.ReportRepository;
import com.zjgs.report.model.ReportDetail;
import com.zjgs.report.model.ReportShare;
import com.zjgs.report.model.Student;
import com.zjgs.report.model.Teacher;
import com.zjgs.report.model.Report;
import com.zjgs.report.pojo.AnalysisReport;
import com.zjgs.report.pojo.Writereport;
import com.zjgs.report.repository.ReaportDeatailRepository;
import com.zjgs.report.repository.ReportShareRepository;
import com.zjgs.report.service.ReportService;
 
@Service
public class ReportServiceImpl implements ReportService {
    
    @Autowired
    private ReportRepository reportRepository;
    
    @Autowired
    private ReaportDeatailRepository reaportDeatailRepository;
    
    @Autowired
    private ReportShareRepository reportShareRepository;

	@Override    
	public void saveReport(Writereport writereport) {
		// TODO Auto-generated method stub
		
		List<Report> rlist=reportRepository.getLastReport(writereport.getSid());
		
		Report lastReport=new Report();
		if(rlist.size()!=0){
			 lastReport=rlist.get(0);
		}else{
			lastReport.setRid("0");
		}
		
		
		SimpleDateFormat tempDate = new SimpleDateFormat("yyyyMMdd");//生成报告号的年月日    
		String datetime = tempDate.format(new java.util.Date());
		String sid=String.valueOf(writereport.getSid());
		String rid=datetime+sid;  //年月日+学生的学号
		
		Report report=new Report();//保存报告
		report.setRid(rid);
		report.setSid(writereport.getSid());
		report.setSname(writereport.getSname());	
		report.setLid(writereport.getLid());
		report.setTid(writereport.getTid());
		reportRepository.save(report);
	
		
		ReportDetail reaportDeatailTask=new ReportDetail();//保存本周任务
		reaportDeatailTask.setRid(rid);
		reaportDeatailTask.setRdtype(1);
		reaportDeatailTask.setRdtext(writereport.getNextplan());
		reaportDeatailTask.setRdconnect(lastReport.getRid());
		reaportDeatailRepository.save(reaportDeatailTask);
		
		
		ReportDetail reaportDeatailProblem=new ReportDetail();//保存本周困难
		reaportDeatailProblem.setRid(rid);
		reaportDeatailProblem.setRdtype(2);
		reaportDeatailProblem.setRdtext(writereport.getNextplan());
		reaportDeatailProblem.setRdconnect(lastReport.getRid());
		reaportDeatailRepository.save(reaportDeatailProblem);
		
		ReportDetail reaportDeatailPlan=new ReportDetail();//保存下周计划
		reaportDeatailPlan.setRid(rid);
		reaportDeatailPlan.setRdtype(3);
		reaportDeatailPlan.setRdtext(writereport.getNextplan());
		reaportDeatailPlan.setRdconnect(lastReport.getRid());
		reaportDeatailRepository.save(reaportDeatailPlan);

	}

	@Override
	public List<AnalysisReport> analysisReport() {
		// TODO Auto-generated method stub
		int name1=1;
		int name2=2;
		int name3=3;		    
		int name4=4;
		int name5=5;
		int name6=6;
		int name7=8;
		int name8=9;
		int name9=10;
		
		int num1 = reportRepository.countByGrade(name1);
		int num2 = reportRepository.countByGrade(name2);
		int num3 = reportRepository.countByGrade(name3);
		int num4 = reportRepository.countByGrade(name4);
		int num5 = reportRepository.countByGrade(name5);
		int num6 = reportRepository.countByGrade(name6);
		int num7 = reportRepository.countByGrade(name7);
		int num8 = reportRepository.countByGrade(name8);
		int num9 = reportRepository.countByGrade(name9);
				
		List<AnalysisReport> list = new ArrayList<AnalysisReport>();
		
		
		AnalysisReport AnalysisReport1 = new AnalysisReport();
		AnalysisReport1.setName(name1);
		AnalysisReport1.setNumber(num1);
		list.add(AnalysisReport1);

		
		AnalysisReport AnalysisReport2 = new AnalysisReport();
		AnalysisReport2.setName(name2);
		AnalysisReport2.setNumber(num2);
    	list.add(AnalysisReport2);
    	
		AnalysisReport AnalysisReport3 = new AnalysisReport();
		AnalysisReport3.setName(name3);
		AnalysisReport3.setNumber(num3);
    	list.add(AnalysisReport3);
    	
		AnalysisReport AnalysisReport4= new AnalysisReport();
		AnalysisReport4.setName(name4);
		AnalysisReport4.setNumber(num4);
    	list.add(AnalysisReport4);
    	
		AnalysisReport AnalysisReport5 = new AnalysisReport();
		AnalysisReport5.setName(name5);
		AnalysisReport5.setNumber(num5);
    	list.add(AnalysisReport5);
    	
		AnalysisReport AnalysisReport6 = new AnalysisReport();
		AnalysisReport6.setName(name6);
		AnalysisReport6.setNumber(num6);
    	list.add(AnalysisReport6);
    	
		AnalysisReport AnalysisReport7 = new AnalysisReport();
		AnalysisReport7.setName(name7);
		AnalysisReport7.setNumber(num7);
    	list.add(AnalysisReport7);
    	
    	
		AnalysisReport AnalysisReport8 = new AnalysisReport();
		AnalysisReport8.setName(name8);
		AnalysisReport8.setNumber(num8);
    	list.add(AnalysisReport8);
    	
		AnalysisReport AnalysisReport9 = new AnalysisReport();
		AnalysisReport9.setName(name9);
		AnalysisReport9.setNumber(num9);
    	list.add(AnalysisReport9);
    	
		return list;
	}

	public List<Report> lookReportlist(int tid) {
 		// TODO Auto-generated method stub
    	    
    	List<Report> rl=reportRepository.findreportlist(tid);
 		return rl;

     }			
	
	public Writereport lookOneStudentReport(Report report) {
 		// TODO Auto-generated method stub 	 	
		Writereport wr=new Writereport();
		wr.setRid(report.getRid());
		
		Report repo=reportRepository.findByRid(report.getRid()); //得到一份完整的报告信息		
		wr.setSid(repo.getSid());
		wr.setSname(repo.getSname());
		
		if(repo.getGrade()!=null){
			wr.setGrade(repo.getGrade());			
		}
		if(repo.getComment()!=null){
			wr.setComment(repo.getComment());		
		}
		List<ReportDetail> onesturp1=reaportDeatailRepository.findDeportDetailListByRid(report.getRid());     //本周报告
		List<ReportDetail> onesturp2=null;   //上周报告
		ReportDetail rd=onesturp1.get(0);  //获得某条详细报告记录，来获得上周报告的RiD
		if(!rd.getRdconnect().equals("0") && rd.getRdconnect()!= null){   //如果上周报告存在的话，获取上周报告的RiD
			onesturp2=reaportDeatailRepository.findDeportDetailListByRid(rd.getRdconnect());
		}	
    	
    	if(onesturp1.size()!=0){
	    	wr.setThistask(onesturp1.get(0).getRdtext());   
	    	wr.setThisproblem(onesturp1.get(1).getRdtext());
	    	wr.setNextplan(onesturp1.get(2).getRdtext()); 
    	}
    	if(onesturp2!=null){
        	wr.setLastproblem(onesturp2.get(1).getRdtext());
        	wr.setLastplan(onesturp2.get(2).getRdtext()); 	
    	}
 		return wr;

     }

	@Override
	public List<Report> studentlookMyReportlist(int sid) {
		// TODO Auto-generated method stub
		List<Report> rl=reportRepository.studentfindmyreportlist(sid);
 		return rl;

	}

	@Override
	public List<Report> lookLabReportlist(int lid) {
		// TODO Auto-generated method stub
		List<Report> rl=reportRepository.studentlookLabReportlist(lid);
 		return rl;
	}

	@Override
	public void teacherCommentReport(Report report) {
		// TODO Auto-generated method stub
		reportRepository.teacherCommentReport2(report.getGrade(),report.getRid());
	}
	
	


	public List<ReportShare> slookShareReportlist(Student student) {
 		// TODO Auto-generated method stub
    	    
    	List<ReportShare> srl=reportShareRepository.findsharereportlist(student.getSid());
 		return srl;

     }	
	
	public List<ReportShare> tlookShareReportlist(int tid) {
 		// TODO Auto-generated method stub
    	     
    	List<ReportShare> srl=reportShareRepository.findsharereportlist(tid);
 		return srl;

     }	
	
	public Writereport lookOneShareReport(ReportShare reportshare) {
 		// TODO Auto-generated method stub
    	
		
		/*String Rid2=reportshare.getRid(); //本周
	

		ArrayList<Report> onesturp2=new ArrayList<Report>();
    	onesturp2=reportRepository.findByRid(Rid2);
    	
    	Writereport wr=new Writereport();

    	wr.setThistask(onesturp2.get(0).getRdtext());   
    	wr.setThisproblem(onesturp2.get(1).getRdtext());
    	wr.setNextplan(onesturp2.get(2).getRdtext()); */
 		return null;

     }		
     
	//分享报告出去
	public void teacherShareReport(Report report,String ID,Teacher teacher) {
		ReportShare rs=new ReportShare();
		rs.setRid(report.getRid());
		rs.setRstopersonid(teacher.getTid());
		rs.setRstopersonid(Integer.valueOf(ID));
		SimpleDateFormat tempDate = new SimpleDateFormat("yyyyMMdd");//生成报告号    
		String datetime = tempDate.format(new java.util.Date());
	   // rs.setRssharetime(datetime);
		
	}

	@Override
	public Writereport studentGetLastReport(int sid) {
		// TODO Auto-generated method stub
		Writereport wr=new Writereport();
		List<Report> rlist=reportRepository.getLastReport(sid);
		if(rlist.size()!=0){
			Report lastReport=rlist.get(0);
			List<ReportDetail> onesturp1 =null;
			onesturp1=reaportDeatailRepository.findDeportDetailListByRid(lastReport.getRid());     //本周报告   
	    	if(onesturp1!=null){
	        	wr.setLastproblem(onesturp1.get(1).getRdtext());
	        	wr.setLastplan(onesturp1.get(2).getRdtext()); 	
	    	}
		}
 		return wr;

	}
	@Override
	public void storeShareSInformation(String rid,int RSToPersonId,int RSFromPersonId)
	{
		
		int Rstype=1; 
		//SimpleDateFormat tempDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//String systime=tempDate.format(new java.util.Date());
		Date date = new Date();
		Timestamp timeStamep = new Timestamp(date.getTime());
		System.out.println(timeStamep);
		reportShareRepository.storeshareinformation(rid,RSToPersonId,RSFromPersonId,Rstype,timeStamep);
	    
	}
	public void storeShareTInformation(String rid,int RSToPersonId,int RSFromPersonId)
	{
		
		int Rstype=2; 
		//SimpleDateFormat tempDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//String systime=tempDate.format(new java.util.Date());
		Date date = new Date();
		Timestamp timeStamep = new Timestamp(date.getTime());
		System.out.println(timeStamep);
	
		reportShareRepository.storeshareinformation(rid,RSToPersonId,RSFromPersonId,Rstype,timeStamep);
	
	}
	
}