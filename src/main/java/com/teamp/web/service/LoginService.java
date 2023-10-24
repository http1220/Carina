package com.teamp.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamp.web.entity.input.MemberInformation;
import com.teamp.web.repository.LoginRepository;
import com.teamp.web.util.EncryptionUtil;

@Service
public class LoginService {

    @Autowired
    private LoginRepository loginRepository;

//    public boolean validateMember(MemberInformation member) {
//        MemberInformation existingMember = loginRepository.findById(member.getId());
//        return existingMember != null && existingMember.getPw1().equals(member.getPw1())
////        		&& existingMember.getMembershipGrade() != 0
//        		;
//    }

    public MemberInformation findByNickname(String id) {
        return loginRepository.findById(id);
    }

    public int findByMembershipGrade(String id) {
        MemberInformation memberInformation = loginRepository.findById(id);
        return memberInformation.getMembershipGrade();
    }


	public MemberInformation findByEmail(String id) {
		return loginRepository.findById(id);
	}

	public boolean validateMember(MemberInformation member) {
	    MemberInformation existingMember = loginRepository.findById(member.getId());
	    if (existingMember != null) {
	        try {
	            // Load the stored private key
//	            PrivateKey privateKey = EncryptionUtilRSA.loadPrivateKey(existingMember.getPrivateKey());
//	            String decryptedPassword = EncryptionUtilRSA.decrypt(existingMember.getPw1(), privateKey);
	            String decryptedPassword = EncryptionUtil.decrypt(existingMember.getPw1(), "ioio");
	            return decryptedPassword.equals(member.getPw1());
	        } catch (Exception e) {
	            return false;
	        }
	    } else {
	        return false;
	    }
	}

	public int findByMembership_status(String id) {
		MemberInformation memberInformation = loginRepository.findById(id);
		return memberInformation.getMembership_status();
	}



}

