package com.teamp.web.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.teamp.web.entity.SafetyEntity;

public interface SafetyRepository extends JpaRepository<SafetyEntity, Integer> {

	List<SafetyEntity> findSafetyBySafetyno(int vehicleno);
}
