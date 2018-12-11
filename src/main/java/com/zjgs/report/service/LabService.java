package com.zjgs.report.service;

import java.util.List;

import com.zjgs.report.model.Lab;

public interface LabService {

	List<Lab> selectLabList();

	void adminDeleteLabByLid(Lab lab);

	void adminEditLabContent(Lab lab);

	void adminEditLabTeacher(Lab lab);
	
	public void saveLab(Lab lab);

}
