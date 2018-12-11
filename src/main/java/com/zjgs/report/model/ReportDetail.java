package com.zjgs.report.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="reportdetail")
public class ReportDetail {


@Id
@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer rdid;  //报告内容详细号

	private String rid;  //报告号
	
	private Integer rdtype;  //报告内容类型（已做事情1/问题2/计划3）

	private String rdtext;  //报告内容
	
	private String rdconnect;  //报告内容关联号

	public Integer getRdid() {
		return rdid;
	}

	public void setRdid(Integer rdid) {
		this.rdid = rdid;
	}

	public String getRid() {
		return rid;
	}

	public void setRid(String rid) {
		this.rid = rid;
	}

	public Integer getRdtype() {
		return rdtype;
	}

	public void setRdtype(Integer rdtype) {
		this.rdtype = rdtype;
	}

	public String getRdtext() {
		return rdtext;
	}

	public void setRdtext(String rdtext) {
		this.rdtext = rdtext;
	}

	public String getRdconnect() {
		return rdconnect;
	}

	public void setRdconnect(String rdconnect) {
		this.rdconnect = rdconnect;
	}

	
	
	
}