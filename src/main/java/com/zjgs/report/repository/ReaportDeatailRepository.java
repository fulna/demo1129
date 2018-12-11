package com.zjgs.report.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;


import com.zjgs.report.model.ReportDetail;

public interface ReaportDeatailRepository  extends JpaRepository<ReportDetail,Integer>{
	
	@Transactional
	@Query(value = "select * from reportdetail r where r.rid=?1 order by rdtype ",nativeQuery = true)
	List<ReportDetail> findDeportDetailListByRid(String rid);

	
	
}
