package com.zjgs.report.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.zjgs.report.model.Teacher;


public interface TeacherRepository  extends JpaRepository<Teacher,Integer>{


	Teacher findByTnameAndPsw(String name,String psw);//查询用户名称为name和密码为psw的用户对象
	
	@Query(value = "select * from teacher where isleader = ?1",nativeQuery = true)
    List<Teacher> findByIsleader(@Param("isleader") int isleader);
	
	@Transactional
	@Modifying
	@Query(value = "update teacher t set t.psw = ?1 where t.id = ?2",nativeQuery = true)
    void editTeacherPsw(@Param("psw") String psw,@Param("id") int id);
	
	@Transactional
	@Modifying
	@Query(value = "update teacher t set t.phone = ?1 where t.id = ?2",nativeQuery = true)
    void editTeacherPhone(@Param("phone") String phone,@Param("id") int id);

	@Query(value = "select * from teacher where isleader = ?1 and lid=?2",nativeQuery = true)
    List<Teacher> findByLeadAndLid(@Param("isleader") int isleader,@Param("lid") int lid);
	
	@Query(value = "select tname from teacher where tname != ?1",nativeQuery = true)
    List findSname(@Param("tname") String tname);
	
	@Query(value = "select tid from teacher where tname = ?1",nativeQuery = true)
	int findsidbytname(@Param("tname") String tname);//查询用户名称为tname的tid


}
