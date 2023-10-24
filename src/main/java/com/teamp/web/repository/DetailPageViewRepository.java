package com.teamp.web.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.teamp.web.entity.output.DetailPageViewEntity;

@Repository
public interface DetailPageViewRepository extends JpaRepository<DetailPageViewEntity, Integer> {

	List<DetailPageViewEntity> findDetailpageviewByBno(int vehicleno);
	
	
	/* 조회수 증가 */
	DetailPageViewEntity findDetailpageviewByVehicleno(int vehicleno); 

	
	
	@Modifying
	@Query("update DetailPageViewEntity d set d.views = d.views + 1 where d.vehicleno = :vehicleno")
	int updateView(@Param("vehicleno")Integer vehicleno);


	

  	

}
