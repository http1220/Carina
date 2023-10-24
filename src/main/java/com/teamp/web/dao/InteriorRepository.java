package com.teamp.web.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.teamp.web.entity.InteriorEntity;

public interface InteriorRepository extends JpaRepository<InteriorEntity, Integer> {

	List<InteriorEntity> findInteriorByInteriorno(int vehicleno);
}
