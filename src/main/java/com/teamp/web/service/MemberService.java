package com.teamp.web.service;

import java.util.Optional;

import org.springframework.stereotype.Service;

import com.teamp.web.entity.input.MemberInformation;
import com.teamp.web.repository.MemberInformationRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberService {

	private final MemberInformationRepository memberInformationRepository;
	
	public int checkID(String id) {
		return memberInformationRepository.countById(id);
	}

	public int checkNickname(String nickname) {
		return memberInformationRepository.countBynickname(nickname);
	}

	public int checkEmail(String email) {
		return memberInformationRepository.countByemail(email);
	}

	public void insertMember(MemberInformation memberInformation) {
		memberInformationRepository.save(memberInformation);
	}

	public Optional<MemberInformation> findById(String id) {
	    return memberInformationRepository.findById(id);
	}

	public void save(MemberInformation existingMemberInfo) {
		memberInformationRepository.save(existingMemberInfo);
	}

	public Optional<MemberInformation> findByEmail(String toEmail) {
		return memberInformationRepository.findByEmail(toEmail);
		
	}

}