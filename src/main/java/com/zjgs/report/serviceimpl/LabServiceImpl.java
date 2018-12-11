package com.zjgs.report.serviceimpl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zjgs.report.model.Lab;
import com.zjgs.report.model.Teacher;
import com.zjgs.report.repository.LabRepository;
import com.zjgs.report.service.LabService;

@Service
public class LabServiceImpl implements LabService {
    
    @Autowired
    private LabRepository labRepository;

	@Override
	public List<Lab> selectLabList() {
		// TODO Auto-generated method stub
		List<Lab> list =labRepository.findAll();
		return list;
	}

	@Override
	public void adminDeleteLabByLid(Lab lab) {
		// TODO Auto-generated method stub
		labRepository.delete(lab);
		//labRepository.deleteLabByLid(lab.getLid());
	}

	@Override
	public void adminEditLabContent(Lab lab) {
		// TODO Auto-generated method stub
		labRepository.editLabContent(lab.getLcontent(),lab.getLid());
	}

	@Override
	public void adminEditLabTeacher(Lab lab) {
		// TODO Auto-generated method stub
		labRepository.editEditLabTeacher(lab.getTid(),lab.getLname(),lab.getLid());
	}

	@Override
	 public void saveLab(Lab lab) {
	  // TODO Auto-generated method stub
	  labRepository.save(lab);
	}
}
