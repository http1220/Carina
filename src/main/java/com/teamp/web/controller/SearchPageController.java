package com.teamp.web.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.teamp.web.entity.output.SearchCriteria;
import com.teamp.web.entity.output.SearchPageView;
import com.teamp.web.service.SearchPageService;


@Controller
public class SearchPageController {
	
	
	@Autowired
	SearchPageService spsj;
		
	
	@GetMapping("/searchpage")
	public ModelAndView search_open() {
		List<SearchPageView> list = new ArrayList<SearchPageView>();
		List<String> list2 = new ArrayList<String>();
		List<String> Manufacturer = new ArrayList<String>();
		List<String> Fueltype = new ArrayList<String>();
		List<String> Vehicletype = new ArrayList<String>();
		List<String> Transmissiontype = new ArrayList<String>();
		List<String> Domesticimport = new ArrayList<String>();
		List<String> Wheeltype = new ArrayList<String>();
		List<String> Passengercapacity = new ArrayList<String>();
		ModelAndView mv = new ModelAndView("searchPage");
		
		Specification<SearchPageView> spec = (root, query, criteriaBuilder) -> null;
		spec = spec.and(SearchCriteria.ckdelete(0));
		
		list = spsj.findAll(spec).getContent();
		int total = spsj.findAll(spec).getTotalPages();
		Manufacturer = spsj.Manufacturer();
		Fueltype = spsj.Fueltype();
		Vehicletype = spsj.Vehicletype();
		Transmissiontype = spsj.Transmissiontype();
		Passengercapacity = spsj.Passengercapacity();
		Domesticimport = spsj.Domesticimport();
		Wheeltype = spsj.Wheeltype();
		mv.addObject("list", list);
		mv.addObject("total" , total);
		mv.addObject("Manufacturer", Manufacturer);
		mv.addObject("Fueltype", Fueltype);
		mv.addObject("Vehicletype", Vehicletype);
		mv.addObject("Transmissiontype", Transmissiontype);
		mv.addObject("Domesticimport", Domesticimport);
		mv.addObject("Wheeltype", Wheeltype);
		mv.addObject("Passengercapacity", Passengercapacity);
		return mv;
	}
	
	
	@ResponseBody
	@GetMapping("/searchBy")
	public  List<SearchPageView> test(HttpServletRequest form_filter , @RequestParam(value = "pageNo" , defaultValue = "0" , required = false) int pageNo) {
		String maker = form_filter.getParameter("maker");
		String type = form_filter.getParameter("type");
		String fuel = form_filter.getParameter("fuel");
		String mission = form_filter.getParameter("mission");
		String wheeldrt = form_filter.getParameter("wheeldrt");
		String psngcap = form_filter.getParameter("psngcap");
		String cc = form_filter.getParameter("cc");
		String model = form_filter.getParameter("model");
		String sort = form_filter.getParameter("sort");
		String priyear = form_filter.getParameter("priyear");
		String afteryear = form_filter.getParameter("afteryear");
		String pridistance = form_filter.getParameter("pridistance");
		String afterdistance = form_filter.getParameter("afterdistance");
		
		String dir = null;
		if(sort == null) {
			sort = "vehicleno";
		} else {
			dir = sort.split("_")[1];
			sort = sort.split("_")[0];
		}
		Specification<SearchPageView> spec = (root, query, criteriaBuilder) -> null;
			spec = spec.and(SearchCriteria.ckdelete(0));
			
		if (!maker.equals("all")) {
			spec = spec.and(SearchCriteria.maker(maker));
		}
		
		if (!type.equals("all")) {
			spec = spec.and(SearchCriteria.type(type));
		}
		if (!fuel.equals("all")) {
			spec = spec.and(SearchCriteria.fuel(fuel));
		}
		if (!mission.equals("all")) {
			spec = spec.and(SearchCriteria.mission(mission));
		}
		if (!psngcap.equals("all")) {
			spec = spec.and(SearchCriteria.psngcap(psngcap));
		}
		if (!wheeldrt.equals("all")) {
			spec = spec.and(SearchCriteria.wheeldrt(wheeldrt));
		}
		if (cc.equals("all")) {        } 
		else if(Integer.parseInt(cc) < 3001) {
			spec = spec.and(SearchCriteria.cc(cc));
		} else {
			spec = spec.and(SearchCriteria.greatercc(cc));
		}

		spec = spec.and(SearchCriteria.betweenyear(priyear , afteryear));
		spec = spec.and(SearchCriteria.betweendistace(pridistance , afterdistance));

		
		if (model != null) {
			System.out.println(model);
			spec = spec.and(SearchCriteria.model(model));
		}
		Page<SearchPageView> result = spsj.findBySpec(spec , pageNo, sort, dir);
		List<SearchPageView> list = result.getContent();
       
        
        return list;
	}
	
	@ResponseBody
	@GetMapping("/gettotalpage")
	public long getlist() {		
		
		return spsj.getTotalpages();
		
	}
	
}