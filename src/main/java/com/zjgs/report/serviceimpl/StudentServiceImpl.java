package com.zjgs.report.serviceimpl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zjgs.report.model.Student;
import com.zjgs.report.model.Teacher;
import com.zjgs.report.repository.StudentRepository;
import com.zjgs.report.service.StudentService;

@Service
public class StudentServiceImpl implements StudentService {
    
    @Autowired
    private StudentRepository studentRepository;

	@Override
    public void saveStudent(Student student) {
		// TODO Auto-generated method stub
		
		studentRepository.save(student);
}

	@Override
	public Student getStudent(Student student) {
		// TODO Auto-generated method stub
		Student result = studentRepository.findBySnameAndPsw(student.getSname(),student.getPsw());
		return result;
	}

	@Override
	public List<Student> selectStudentByLeadAndLid(int tid) {
		// TODO Auto-generated method stub
		List<Student> list=studentRepository.findByTid(tid);
		return list;
	}

	@Override
	public void teacherDeleteStudent(Student student) {
		// TODO Auto-generated method stub
		studentRepository.delete(student);
	}

	@Override
	public void teacherEditStudentPsw(Student student) {
		// TODO Auto-generated method stub
		studentRepository.editStudentPsw(student.getPsw(),student.getSid());
	}

	@Override
	public void teacherEditStudentPhone(Student student) {
		// TODO Auto-generated method stub
		studentRepository.editStudentPhone(student.getPhone(),student.getSid());
	}

	@Override
	public List getAllName(int rsfrompersonid) {
		// TODO Auto-generated method stub
		List list1 = studentRepository.findSname(rsfrompersonid);
	
		return list1;
	}
	@Override
	public int findSidBySname(String sname){
		int RSToPersonId=studentRepository.findsidbysname(sname);
		return RSToPersonId;
		
	}
	 	
}
