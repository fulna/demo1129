package com.zjgs.report.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.zjgs.report.model.Student;

public interface StudentService {
	public void saveStudent(Student student);

	public Student getStudent(Student student);

	public List<Student> selectStudentByLeadAndLid(int tid);

	public void teacherDeleteStudent(Student student);

	public void teacherEditStudentPsw(Student student);

	public void teacherEditStudentPhone(Student student);

	public List getAllName(int rsfrompersonid);
	public int findSidBySname(String sname);
	
}
