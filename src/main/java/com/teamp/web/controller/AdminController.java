package com.teamp.web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.criterion.Example;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.teamp.web.entity.input.Board;
import com.teamp.web.entity.input.MemberInformation;
import com.teamp.web.entity.output.SearchCriteria;
import com.teamp.web.entity.output.SearchPageView;
import com.teamp.web.service.AdminService;
import com.teamp.web.service.MemberService;

@Controller
public class AdminController {
	
	@Autowired
	AdminService adminservice;
	
	@Autowired
	MemberService mesv;
	
	@GetMapping("/admin")
	public ModelAndView main_open(HttpSession session) {
		ModelAndView mv = new ModelAndView("/admin/default");
		String adminid = (String) session.getAttribute("id");
		int menty = mesv.findById(adminid).get().getMembership_status();
		System.out.println(menty);
		if(menty - 2 != 0) {
			mv.setViewName("./index");
			return mv;
		}
		return mv;
	}
	
	@GetMapping("/admin/member")
	public ModelAndView member_open(@RequestParam(value = "page" , required=false , defaultValue = "0") int p) {
		ModelAndView mv = new ModelAndView("/admin/member");
		int page;
		if(p == 0) {page = 1;} else {page = p;}
		PageRequest req = PageRequest.of(page-1, 14);
		List<MemberInformation> memberlist = adminservice.member_getlist(req);
		int now = adminservice.member_getNow(req);
		int totalpages = adminservice.member_gettotalpages(req);
		if(memberlist.isEmpty()) {
			mv.setViewName("redirect:/admin/member");
			} 
		else {
			mv.addObject("memberlist", memberlist); 
			mv.addObject("totalpages", totalpages);
			mv.addObject("nowpage", now);
			}		
		return mv;
	}
	
	@ResponseBody
	@GetMapping("/admin/memberdetail")
	public MemberInformation get_member_detail(@RequestParam("member") String id){		
		MemberInformation memberdetail = adminservice.member_getdetail(id).get();
		System.out.println(memberdetail);
		return memberdetail;
		
	}
	
	@ResponseBody
	@PostMapping("/admin/userban")
	public void userban(@RequestBody MemberInformation memberinfo) {
		//System.out.println(memberinfo.getId());
		adminservice.userban(memberinfo.getId());
	}
	
	@GetMapping("/admin/board")
	public ModelAndView board_open(@RequestParam(value = "page" , required=false , defaultValue = "0") int p) {
		ModelAndView mv = new ModelAndView("/admin/board");
		int page;
		if(p == 0) {page = 1;} else {page = p;}		
		PageRequest req = PageRequest.of(page-1, 14);
		Specification<Board> spec = (root, query, criteriaBuilder) -> null;
		spec = spec.and(SearchCriteria.isdelete(0));
		
		
		List<Board> boardlist = adminservice.board_getlist(spec , req);
		int now = adminservice.board_getNow(req);
		int totalpages = adminservice.board_gettotalpages(req);
		if(boardlist.isEmpty()) {
			mv.setViewName("redirect:/admin/board");
			} 
		else {
			mv.addObject("boardlist", boardlist); 
			mv.addObject("totalpages", totalpages);
			mv.addObject("nowpage", now);
			}		
		return mv;
	}
	
	@ResponseBody
	@GetMapping("/admin/boarddetail")
	public  Board get_board_detail(@RequestParam("board") int bno){
		
		Board board = adminservice.boardgetdetail(bno);
		System.out.println(board);
		return board;
	}
	
	
	@ResponseBody
	@PostMapping("/admin/boardban")
	public void boardban(@RequestBody Board board) {

		adminservice.boardban(board.getBno());
	}
	

}
