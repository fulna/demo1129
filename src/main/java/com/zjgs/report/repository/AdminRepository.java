package com.zjgs.report.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.zjgs.report.model.Admin;

public interface AdminRepository  extends JpaRepository<Admin,Integer>{
	
	Admin findByAnameAndPsw(String name,String psw);//查询用户名称为name和密码为psw的用户对象

}
