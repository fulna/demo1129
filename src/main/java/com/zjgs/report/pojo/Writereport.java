package com.zjgs.report.pojo;

public class Writereport {

	private String rid;  //报告号
	
	private Integer sid;  //学生学号

	private String sname;  //学生姓名
	
	private String lastplan;  //上周计划

	private String lastproblem;  //上周困难
	
	private String thistask;  //本周完成情况

	private String thisproblem;  //本周困难
	
	private String nextplan;  //下周计划
	
	private int grade;  //导师评分
	
	private String comment;  //导师评语
	
	private Integer lid;  //实验室号
	
	private Integer tid;  //导师教工号
	
	public String getRid() {
		return rid;
	}

	public void setRid(String rid) {
		this.rid = rid;
	}

	public Integer getSid() {
		return sid;
	}

	public void setSid(Integer sid) {
		this.sid = sid;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getLastplan() {
		return lastplan;
	}

	public void setLastplan(String lastplan) {
		this.lastplan = lastplan;
	}

	public String getLastproblem() {
		return lastproblem;
	}

	public void setLastproblem(String lastproblem) {
		this.lastproblem = lastproblem;
	}

	public String getThistask() {
		return thistask;
	}

	public void setThistask(String thistask) {
		this.thistask = thistask;
	}

	public String getThisproblem() {
		return thisproblem;
	}

	public void setThisproblem(String thisproblem) {
		this.thisproblem = thisproblem;
	}

	public String getNextplan() {
		return nextplan;
	}

	public void setNextplan(String nextplan) {
		this.nextplan = nextplan;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Integer getLid() {
		return lid;
	}

	public void setLid(Integer lid) {
		this.lid = lid;
	}

	public Integer getTid() {
		return tid;
	}

	public void setTid(Integer tid) {
		this.tid = tid;
	}

	
}
