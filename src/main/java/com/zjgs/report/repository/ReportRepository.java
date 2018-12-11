package com.zjgs.report.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.zjgs.report.model.Report;

public interface ReportRepository  extends JpaRepository<Report,Integer>,JpaSpecificationExecutor<Report>{


	Report findByRid(String rid);
	
	int countByGrade(int name);
	
	@Modifying	
	@Transactional
	@Query(value = "update report r set r.grade = ?1 where r.rid = ?2",nativeQuery = true)	
    void teacherCommentReport2(@Param("grade") int grade,@Param("rid") String rid);

	
	
	@Transactional
	@Query(value = "select * from report r where r.tid=?1 order by RiD desc",nativeQuery = true)
    List<Report> findreportlist(int tid);
	 

	@Transactional
	@Query(value = "select * from report r where r.sname=?1 order by rid desc",nativeQuery = true)
	List<Report> findTwoRid(String sname);
	
	@Transactional
	@Query(value = "select * from report r where r.sid=?1 order by RiD desc",nativeQuery = true)
    List<Report> studentfindmyreportlist(int sid);

	
	@Transactional
	@Query(value = "select * from report r where r.lid=?1 order by RiD desc",nativeQuery = true)
	List<Report> studentlookLabReportlist(int lid);

	@Transactional
	@Query(value = "select * from report r where r.sid=?1 order by RiD desc",nativeQuery = true)
	List<Report> getLastReport(int sid);
	

	
	
	
}
