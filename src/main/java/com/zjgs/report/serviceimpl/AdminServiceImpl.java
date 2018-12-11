package com.zjgs.report.serviceimpl;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zjgs.report.model.Admin;
import com.zjgs.report.repository.AdminRepository;
import com.zjgs.report.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService {
    
    @Autowired
    private AdminRepository adminRepository;

	@Override
	public Admin getAdmin(Admin admin) {
		// TODO Auto-generated method stub
		Admin result = adminRepository.findByAnameAndPsw(admin.getAname(),admin.getPsw());
		return result;


	}


}
