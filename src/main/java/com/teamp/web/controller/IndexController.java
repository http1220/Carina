package com.teamp.web.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.teamp.web.entity.output.SearchPageView;
import com.teamp.web.service.IndexService;


import com.teamp.web.service.SearchPageService;
@Controller

public class IndexController {
	
	@Autowired
	private IndexService indexService;
	
	@Autowired
	SearchPageService spsj;
	
	@GetMapping("/index")
	public ModelAndView index(){
		
		ModelAndView mv = new ModelAndView("index");
		
		List<SearchPageView> carlist =indexService.findTop5ByOrderByViewsDesc();
		mv.addObject("carlist", carlist);
		
		
		return mv;
	
	
	


	}
	
	
	
	@GetMapping("/indexsearch")
	public  ModelAndView result_search(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String kwd = request.getParameter("model");
		System.out.println(kwd);
		List<SearchPageView> list = new ArrayList<SearchPageView>();
		System.out.println("해보긴 해봤니");
		
		list = spsj.searchkwd(kwd);
		long total = spsj.getTotalpages();
		System.out.println("결과는" + list);
		System.out.println("그래서 최종은?" + list);
		
		mv.setViewName("/searchPage");
		mv.addObject("list", list);
		mv.addObject("total", total);
		mv.addObject("kwd", kwd);
		return mv;
	}
}
