package com.zjgs.report.service;

import java.util.List;

import com.zjgs.report.model.Report;
import com.zjgs.report.model.ReportShare;
import com.zjgs.report.model.Teacher;
import com.zjgs.report.pojo.AnalysisReport;
import com.zjgs.report.pojo.Writereport;

public interface ReportService {
	public void saveReport(Writereport writereport);

	public List<AnalysisReport> analysisReport();
	
	public List<Report> lookReportlist(int tid);
	
	public Writereport lookOneStudentReport(Report report);

	public List<Report> studentlookMyReportlist(int sid);

	public List<Report> lookLabReportlist(int lid);

	public void teacherCommentReport(Report report);

	public void teacherShareReport(Report report, String iD, Teacher teacher);

	public List<ReportShare> tlookShareReportlist(int tid);

	public Writereport lookOneShareReport(ReportShare reportshare);

	public Writereport studentGetLastReport(int sid);

	public void storeShareSInformation(String rid, int RSToPersonId, int RSFromPersonId);
	
	public void storeShareTInformation(String rid, int RSToPersonId, int RSFromPersonId);

}
