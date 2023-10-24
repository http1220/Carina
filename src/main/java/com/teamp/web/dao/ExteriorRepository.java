package com.teamp.web.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.teamp.web.entity.ExteriorEntity;

public interface ExteriorRepository extends JpaRepository<ExteriorEntity, Integer> {

	List<ExteriorEntity> findExteriorByExteriorno(int vehicleno);


	
}
