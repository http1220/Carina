package com.teamp.web.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.teamp.web.entity.VehicleInformationEntity;


public interface VehicleInformationRepository extends JpaRepository<VehicleInformationEntity, Integer> {

	List<VehicleInformationEntity> findVehicleInformationByVehicleno(int vehicleno);
		
}

