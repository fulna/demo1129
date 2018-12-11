package com.zjgs.report.service;

import java.util.List;

import com.zjgs.report.model.Student;
import com.zjgs.report.model.Teacher;


public interface TeacherService {

	public void saveTeacher(Teacher teacher);

	public List<Teacher> selectLeaderTeacher(int lead);

	public void adminDeleteTeacher(Teacher teacher);

	public void adminEditTeacherPsw(Teacher teacher);

	public void adminEditTeacherPhone(Teacher teacher);

	public void adminSaveTeacher(Teacher teacher);

	public Teacher getTeacher(Teacher teacher);

	public List<Teacher> getTeacherlist();

	public List<Teacher> selectTeacherByLeadAndLid(int lead, int lid);

	public List<String> getAllName(String tname);
	
	public int findSidByTname(String tname);
	
}
