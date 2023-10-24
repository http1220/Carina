package com.teamp.web.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.teamp.web.entity.ConvenienceEntity;

public interface ConvenienceRepository extends JpaRepository<ConvenienceEntity, Integer> {

	List<ConvenienceEntity> findConvenienceByConvenienceno(int vehicleno);
}
