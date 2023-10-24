package com.teamp.web.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.teamp.web.entity.input.MemberInformation;

public interface MemberInformationRepository extends JpaRepository<MemberInformation, Long> {

	int countById(String id);

	int countBynickname(String nickname);

	int countByemail(String email);

	Optional<MemberInformation> findById(String id);

	Optional<MemberInformation> findByEmail(String toEmail);

}
