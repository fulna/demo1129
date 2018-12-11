package com.zjgs.report.repository;


import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.zjgs.report.model.ReportShare;

public interface ReportShareRepository  extends JpaRepository<ReportShare,Integer>{
	
	@Query(value = "select rsid,rid,rstopersonid,rsfrompersonid,rstype,DATE_FORMAT(rssharetime,'%Y-%m-%d %H:%i:%S') AS rssharetime from reportshare where RSToPersonId=?1 order by RiD desc",nativeQuery = true)
    List<ReportShare> findsharereportlist(@Param("RSToPersonId") Integer RSToPersonId);


	@Transactional
	@Modifying
	@Query(value = "insert into reportshare set rid = ?1, RSToPersonId= ?2, RSFromPersonId = ?3, RSType= ?4, RSShareTime= ?5 ",nativeQuery = true)
    void storeshareinformation(@Param("rid") String rid,@Param("RSToPersonId") int RSToPersonId,@Param("RSFromPersonId") int RSFromPersonId,@Param("RSType") int RSType,@Param("RSShareTime") Timestamp timeStamep);




}
