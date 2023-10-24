package com.teamp.web.service;

import java.util.List;
import java.util.Optional;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.teamp.web.entity.input.Board;
import com.teamp.web.entity.input.MemberInformation;
import com.teamp.web.entity.output.SearchPageView;
import com.teamp.web.repository.BoardRepository;
import com.teamp.web.repository.MemberInformationRepository;

@Service
public class AdminService {
	
	@Autowired
	MemberInformationRepository memberrepo;
	
	@Autowired
	BoardRepository boardrepo;
	

	public List<MemberInformation> member_getlist(PageRequest req) {

		return memberrepo.findAll(req).getContent();
	}

	public int member_gettotalpages(PageRequest req) {
		
		
		return memberrepo.findAll(req).getTotalPages();
	}

	public int member_getNow(PageRequest req) {
		
		return memberrepo.findAll(req).getNumber();
	}

	public Optional<MemberInformation> member_getdetail(String id) {
		
		return memberrepo.findById(id);
	}

	public List<Board> board_getlist(Specification<Board> spec, PageRequest req) {
		
		return boardrepo.findAll(spec, req).getContent();
	}

	public Board boardgetdetail(int bno) {
		return boardrepo.findBoardByBno(bno);
		
	}

	public int board_getNow(PageRequest req) {
		
		return boardrepo.findAll(req).getNumber();
	}

	public int board_gettotalpages(PageRequest req) {
		
		return boardrepo.findAll(req).getTotalPages();
	}

	public void userban(String id) {
		MemberInformation r = memberrepo.findById(id).get();
		r.setMembership_status(0);
		memberrepo.save(r);		
	}

	public void boardban(int bno) {
		Board r = boardrepo.findBoardByBno(bno);
		r.setIsdelete(1);
		boardrepo.save(r);
		
	}


}
