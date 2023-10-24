package com.teamp.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.teamp.web.entity.output.SearchPageView;
import com.teamp.web.entity.output.SearchPageViewRepo;
import com.teamp.web.entity.output.brandname;

@Service
public class SearchPageService {
	
	private long totalpages;
	
	@Autowired
	SearchPageViewRepo repo;
	
	public Page<SearchPageView> findAll(Specification<SearchPageView> spec) {
		// TODO Auto-generated method stub
		String sortkey = "vehicleno";
		PageRequest pageRequest = PageRequest.of(0, 8, Sort.by(sortkey).descending());
		return repo.findAll(spec, pageRequest);
	}

	public Page<SearchPageView> findBySpec(Specification<SearchPageView> spec , int pageNo, String sortkey, String dir) {
		
		Direction direction = Direction.fromString(dir);
		
		PageRequest pageRequest = PageRequest.of(pageNo, 8 , direction, sortkey);
		
		Page<SearchPageView> list = repo.findAll(spec , pageRequest);
		setTotalpages(list.getTotalPages());
		System.out.println(totalpages);
		return list;
	}


	public long getTotalpages() {
		return totalpages;
	}

	public void setTotalpages(long totalpage) {
		this.totalpages = totalpage;
	}

	public List<SearchPageView> searchkwd(String kwd) {
		long els = repo.countByModelnameContaining(kwd);
		long totalpage = els/8 + 1;
		setTotalpages(totalpage);
		return repo.findByModelnameContaining(kwd);
		
	}

	public List<brandname> getfiltername() {
		return repo.findDistinctSearchPageViewBy();
	}
	
	public List<String> Transmissiontype() {
		return repo.findDistinctTransmissiontype();
	}
	
	public List<String> Manufacturer() {
		return repo.findDistinctManufacturer();
	}
	
	public List<String> Fueltype() {
		return repo.findDistinctFueltype();
	}
	
	public List<String> Vehicletype() {
		return repo.findDistinctVehicletype();
	}
	
	public List<String> Passengercapacity() {
		return repo.findDistinctPassengercapacity();
	}
	
	public List<String> Domesticimport() {
		return repo.findDistinctDomesticimport();
	}
	
	public List<String> Wheeltype() {
		return repo.findDistinctWheeltype();
	}

	

//	public List<SearchPageView> findAllByModelnameContains(String kwd){
//
//		return repo.findByModelnameContains(kwd);
//	}


}
