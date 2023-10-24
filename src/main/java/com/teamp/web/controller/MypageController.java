package com.teamp.web.controller;


import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.teamp.web.entity.input.Board;
import com.teamp.web.entity.input.MemberInformation;
import com.teamp.web.repository.BoardRepository;
import com.teamp.web.service.MemberService;

@Controller
public class MypageController {
	
	@Autowired
	MemberService memberservice;
	
	@Autowired
	BoardRepository boardrepo;
	
	@GetMapping("/mypage")
	public String mypage(HttpSession session) {
		
		String user_id = (String) session.getAttribute("id");
		if(!memberservice.findById(user_id).isPresent()) {
			return "/login";
		}
		System.out.println(user_id);
		
		return "/mypage/mypage";
	}
	
	@GetMapping("/myimfo")
	public ModelAndView myinfo(HttpSession session) {
		
		String user_id = (String) session.getAttribute("id");
		System.out.println(user_id);
		ModelAndView mv = new ModelAndView();

		if(memberservice.findById(user_id).isPresent()) {
			System.out.println("해당 id는 정상 사용자 입니다.");
			MemberInformation info = memberservice.findById(user_id).get();
			mv.addObject("info", info);
			mv.setViewName("/mypage/myimfo");
		} else {
			System.err.println("실패!");
			mv.setViewName("error");
		}
		
		//session.removeAttribute("id");
		return mv;
	}
	
	@PostMapping("/updatemyinfo")
	public String updatemyinfo(HttpServletRequest request) {
		String user_id = request.getParameter("id");
		String updatenickname = request.getParameter("nickname");
		String updateemail = request.getParameter("email");
		String updatephone = request.getParameter("phoneNumber");
		System.out.println(user_id + updatenickname + updateemail);
		System.out.println(memberservice.findById(user_id).isPresent());
		Optional<MemberInformation> updatemyinfo = memberservice.findById(user_id);
		updatemyinfo.get().setNickname(updatenickname);
		updatemyinfo.get().setEmail(updateemail);
		updatemyinfo.get().setPhoneNumber(updatephone);
		memberservice.save(updatemyinfo.get());
		
		return "/mypage/myimfo";
	}
	
	@GetMapping("/favlist")
	public ModelAndView favlist(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String user_id = (String) session.getAttribute("id");
		if(!memberservice.findById(user_id).isPresent()) {
			mv.setViewName("/login");
			return mv;
		}
		
		try {	
			if(memberservice.findById(user_id).isPresent()) {
				System.out.println("찜목록 : 해당 id는 정상 사용자 입니다." + user_id);
				mv.setViewName("/mypage/favlist");
			}
		} catch (Exception e) {
			
			mv.setViewName("error");
		}
		
		return mv;
	}
	
	@GetMapping("/estimate")
	public String estimate(HttpSession session) {
		String user_id = (String) session.getAttribute("id");
		if(!memberservice.findById(user_id).isPresent()) {
			return "/login";
		}
		return "/mypage/estimate";
	}
	
	@GetMapping("/myproduct")
	public ModelAndView myproduct(HttpSession session) {
		ModelAndView mv = new ModelAndView("/mypage/myproduct");
		String user_id = (String) session.getAttribute("id");
//		String user_id = (String) session.getAttribute("id");
		if(!memberservice.findById(user_id).isPresent()) {
			mv.setViewName("/login");
			return mv;
		}
//		Optional<MemberInformation> memberinfo = memberservice.findById(user_id);
//		String nickname = memberinfo.get().getNickname();
		
//		  매물 등록 차량 모델명
		
		
//	      거래 희망일
//	      거래 희망 장소
//	      등록일
//	      조회수
//	      거래 요청 내역
//	      판매취소
		
		List<Board> list = boardrepo.findAll();
		
		
		mv.addObject("products", list);
		return mv;
	}
	
	@ResponseBody
	@PostMapping("/deletboard")
	public void deletboard(@RequestBody Board board){
		System.out.println(board.getBno());
		boardrepo.deleteById(board.getBno());

	}
	
	@GetMapping("/myinfo")
	public String myimfo(HttpSession session) {
		String user_id = (String) session.getAttribute("id");
		if(!memberservice.findById(user_id).isPresent()) {
			return "/login";
		}
		return "/mypage/myimfo";
	}
	
	
	  @GetMapping("/sessionout")
	  public String logout(HttpSession session) {
	    
	    String id = (String) session.getAttribute("id");
	    // 데이터베이스에서 지정된 ID로 memberInformation 정보 로드
        Optional<MemberInformation> optionalMemberInfo1 = memberservice.findById(id);
        
        // memberInformation 정보가 있는지 확인합니다
        if (optionalMemberInfo1.isPresent()) {
            // 로드된 memberInformation 정보의 MembershipGrade 업데이트
            MemberInformation existingMemberInfo1 = optionalMemberInfo1.get();
            existingMemberInfo1.setMembership_status(0);
            
            // 업데이트된 memberInformation 정보를 데이터베이스에 다시 저장
            memberservice.save(existingMemberInfo1);
            // 전체 세션삭제
            session.invalidate();
        }else {
	            // memberInformation 정보를 찾을 수 없는 경우 처리
	        	System.out.println("회원정보에서 해당 id를 찾을 수 없습니다. : " + id);
	        	return "invalidId";
	        }
	    return "redirect:/index";
	  }
}