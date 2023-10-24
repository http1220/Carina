package com.teamp.web.service;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import com.teamp.web.entity.output.SearchPageView;
import com.teamp.web.entity.output.SearchPageViewRepo;
import com.teamp.web.repository.DetailPageViewRepository;


@Service
public class IndexService {
	
	@Autowired
	private SearchPageViewRepo repo;
				
	public List<SearchPageView> findTop5ByOrderByViewsDesc() {
		
		return repo.findTop5ByOrderByViewsDesc();
	}
	
	  
	
}	


	
	

	

	


	

	



