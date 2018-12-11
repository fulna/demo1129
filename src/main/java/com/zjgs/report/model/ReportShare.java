package com.zjgs.report.model;

import java.sql.Timestamp;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
 
@Entity
@Table(name="reportshare")
public class ReportShare {


@Id
@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer rsid;  //报告分享号

	private String rid;  //被分享的报告号
	
	private Integer rstopersonid;  //被分享人ID

	private Integer rsfrompersonid;  //分享人ID

	private Integer rstype;  //分享类型（老师给老师，老师给学生）
	
	private String rssharetime;  //分享时间

	public Integer getRsid() {
		return rsid;
	}

	public void setRsid(Integer rsid) {
		this.rsid = rsid;
	}

	public String getRid() {
		return rid;
	}

	public void setRid(String rid) {
		this.rid = rid;
	}

	public Integer getRstopersonid() {
		return rstopersonid;
	}

	public void setRstopersonid(Integer rstopersonid) {
		this.rstopersonid = rstopersonid;
	}

	public Integer getRsfrompersonid() {
		return rsfrompersonid;
	}

	public void setRsfrompersonid(Integer rsfrompersonid) {
		this.rsfrompersonid = rsfrompersonid;
	}

	public Integer getRstype() {
		return rstype;
	}

	public void setRstype(Integer rstype) {
		this.rstype = rstype;
	}

	public String getRssharetime() {
		return rssharetime;
	}
	
	public void setRssharetime(String rssharetime) {
		this.rssharetime = rssharetime;
	}

	
	
}