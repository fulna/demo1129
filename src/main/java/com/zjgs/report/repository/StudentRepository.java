package com.zjgs.report.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.zjgs.report.model.Student;

public interface StudentRepository  extends JpaRepository<Student,Integer>{
	
	Student findBySnameAndPsw(String name,String psw);//查询用户名称为name和密码为psw的用户对象
	

	@Query(value = "select * from student where tid = ?1",nativeQuery = true)
    List<Student> findByTid(@Param("tid") int tid);

	@Transactional
	@Modifying
	@Query(value = "update student s set s.psw = ?1 where s.sid = ?2",nativeQuery = true)
    void editStudentPsw(@Param("psw") String psw,@Param("sid") int sid);
	
	@Transactional
	@Modifying
	@Query(value = "update student s set s.phone = ?1 where s.sid = ?2",nativeQuery = true)
    void editStudentPhone(@Param("phone") String phone,@Param("sid") int sid);
	
	@Query(value = "select sname from student where Tid = ?1",nativeQuery = true)
    List findSname(@Param("Tid") int rsfrompersonid);
	
	@Query(value = "select sid from student where sname = ?1",nativeQuery = true)
	int findsidbysname(@Param("sname") String sname);//查询用户名称为name的sid
}
