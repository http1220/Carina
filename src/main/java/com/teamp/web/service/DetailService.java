package com.teamp.web.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamp.web.dao.ConvenienceRepository;
import com.teamp.web.dao.ExteriorRepository;
import com.teamp.web.dao.InteriorRepository;
import com.teamp.web.dao.MultimediaRepository;
import com.teamp.web.dao.PhotoRepository;
import com.teamp.web.dao.SafetyRepository;
import com.teamp.web.dao.VehicleInformationRepository;
import com.teamp.web.entity.ConvenienceEntity;
import com.teamp.web.entity.ExteriorEntity;
import com.teamp.web.entity.InteriorEntity;
import com.teamp.web.entity.MultimediaEntity;
import com.teamp.web.entity.PhotoEntity;
import com.teamp.web.entity.SafetyEntity;
import com.teamp.web.entity.VehicleInformationEntity;
import com.teamp.web.entity.output.DetailPageViewEntity;
import com.teamp.web.repository.DetailPageViewRepository;




@Service
public class DetailService {
	
	@Autowired
	private PhotoRepository photoRepository;
	
	@Autowired
	private VehicleInformationRepository vehicleInformationRepository;
	
	@Autowired
	private ExteriorRepository exteriorRepository;
	
	@Autowired 
	private InteriorRepository interiorRepository;
	
	@Autowired
	private SafetyRepository safetyRepository;
	
	@Autowired
	private ConvenienceRepository convenienceRepository;
	
	@Autowired
	private MultimediaRepository multimediaRepository;
	
	@Autowired
	private DetailPageViewRepository detailPageViewRepository;
	

	public List<PhotoEntity> findPhotoByPhotono(int vehicleno) {
	
		return photoRepository.findPhotoByPhotono(vehicleno);
	}

	public List<VehicleInformationEntity> findVehicleInformationByVehicleno(int vehicleno) {
		
		return vehicleInformationRepository.findVehicleInformationByVehicleno(vehicleno);
	}

	public List<ExteriorEntity> findExteriorByExteriorno(int vehicleno) {
		
		return exteriorRepository.findExteriorByExteriorno(vehicleno);
	}

	public List<InteriorEntity> findInteriorByInteriorno(int vehicleno) {
		
		return interiorRepository.findInteriorByInteriorno(vehicleno);
	}

	public List<SafetyEntity> findSafetyBySafetyno(int vehicleno) {
		
		return safetyRepository.findSafetyBySafetyno(vehicleno);
	}

	public List<ConvenienceEntity> findConvenienceByConvenienceno(int vehicleno) {
		
		return convenienceRepository.findConvenienceByConvenienceno(vehicleno);
	}

	public List<MultimediaEntity> findMultimediaByMultimediano(int vehicleno) {
		
		return multimediaRepository.findMultimediaByMultimediano(vehicleno);
	}

	public List<DetailPageViewEntity> findDetailpageviewByBno(int vehicleno) {
		
		return detailPageViewRepository.findDetailpageviewByBno(vehicleno) ;
	}

	public DetailPageViewEntity findDetailPageViewEntityByVehicleno(int vehicleno) {

		return detailPageViewRepository.findDetailpageviewByVehicleno(vehicleno);
	}
	
	 @Transactional
	 
	   public void updateView(Integer vehicleno) {
		 
		 detailPageViewRepository.updateView(vehicleno);
		 }
	 
	  
	
}	


	
	

	

	


	

	



