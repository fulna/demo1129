package com.zjgs.report.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.zjgs.report.model.Lab;

public interface LabRepository  extends JpaRepository<Lab,Integer>{
	
	@Transactional
	@Modifying
	@Query(value = "update lab t set t.lcontent = ?1 where t.lid = ?2",nativeQuery = true)
    void editLabContent(@Param("lcontent") String lcontent,@Param("lid") int lid);

	@Transactional
	@Modifying
	@Query(value = "update lab t set t.tid = ?1,t.lname = ?2 where t.lid = ?3",nativeQuery = true)
    void editEditLabTeacher(@Param("tid") int tid,@Param("lname") String lname,@Param("lid") int lid);
	
}
