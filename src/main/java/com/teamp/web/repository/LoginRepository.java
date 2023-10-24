package com.teamp.web.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.teamp.web.entity.input.MemberInformation;

@Repository
public interface LoginRepository extends JpaRepository<MemberInformation, Long> {

	MemberInformation findById(String id);

}
