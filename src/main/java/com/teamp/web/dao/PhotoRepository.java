package com.teamp.web.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.teamp.web.entity.PhotoEntity;

public interface PhotoRepository extends JpaRepository<PhotoEntity, Integer> {

	List<PhotoEntity> findPhotoByPhotono(int vehicleno);

	
}
