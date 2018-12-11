package com.zjgs.report.serviceimpl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zjgs.report.model.Teacher;
import com.zjgs.report.repository.TeacherRepository;
import com.zjgs.report.service.TeacherService;

@Service
public class TeacherServiceImpl implements TeacherService {
    
    @Autowired
    private TeacherRepository teacherRepository;
	
    @Override
    public void saveTeacher(Teacher teacher) {
		// TODO Auto-generated method stub
		
		teacherRepository.save(teacher);
    }

	@Override
	public List<Teacher> selectLeaderTeacher(int lead) {
		// TODO Auto-generated method stub
		List<Teacher> list=teacherRepository.findByIsleader(lead);
		return list;
	}

	@Override
	public void adminDeleteTeacher(Teacher teacher) {
		// TODO Auto-generated method stub
		teacherRepository.delete(teacher);
	}

	@Override
	public void adminEditTeacherPsw(Teacher teacher) {
		// TODO Auto-generated method stub
		//teacherRepository.saveAndFlush(teacher);
		teacherRepository.editTeacherPsw(teacher.getPsw(),teacher.getId());
	}

	@Override
	public void adminEditTeacherPhone(Teacher teacher) {
		// TODO Auto-generated method stub
		teacherRepository.editTeacherPhone(teacher.getPhone(),teacher.getId());
	}
			
	@Override
	public void adminSaveTeacher(Teacher teacher) {
		// TODO Auto-generated method stub
		teacherRepository.save(teacher);
	}

	@Override
	public Teacher getTeacher(Teacher teacher) {
		// TODO Auto-generated method stub
		Teacher result = teacherRepository.findByTnameAndPsw(teacher.getTname(),teacher.getPsw());
		return result;
	}

	@Override
	public List<Teacher> getTeacherlist() {
		// TODO Auto-generated method stub
		List<Teacher> list=teacherRepository.findAll();
		return list;
	}

	@Override
	public List<Teacher> selectTeacherByLeadAndLid(int lead, int lid) {
		// TODO Auto-generated method stub
		List<Teacher> list=teacherRepository.findByLeadAndLid(lead,lid);
		return list;
	}

	@Override
	public List<String> getAllName(String tname) {
		// TODO Auto-generated method stub
		List list1 = teacherRepository.findSname(tname);
		return list1;
	}
	@Override
	public int findSidByTname(String tname){
		int RSToPersonId=teacherRepository.findsidbytname(tname);
		return RSToPersonId;
		
	}
	
	}

