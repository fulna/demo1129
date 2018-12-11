package com.zjgs.report.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="report")
public class Report {


@Id
@GeneratedValue(strategy = GenerationType.AUTO)
	private String id;  //序号

	private String rid;  //报告号
	
	private Integer lid;  //实验室号
 
	private Integer sid;  //学生学号
	
	private String sname;  //学生姓名
	
	private Integer tid;  //教工号

	private Integer grade;  //报告成绩
	
	private String comment;  //报告评语
	
	private Integer rflag;  //是否延期

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRid() {
		return rid;
	}

	public void setRid(String rid) {
		this.rid = rid;
	}

	public Integer getLid() {
		return lid;
	}

	public void setLid(Integer lid) {
		this.lid = lid;
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

	public Integer getTid() {
		return tid;
	}

	public void setTid(Integer tid) {
		this.tid = tid;
	}

	public Integer getGrade() {
		return grade;
	}

	public void setGrade(Integer grade) {
		this.grade = grade;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Integer getRflag() {
		return rflag;
	}

	public void setRflag(Integer rflag) {
		this.rflag = rflag;
	}
	
	
}