package com.teamp.web.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.teamp.web.entity.MultimediaEntity;

public interface MultimediaRepository extends JpaRepository<MultimediaEntity, Integer> {

	List<MultimediaEntity> findMultimediaByMultimediano(int vehicleno);
}
