package com.teamp.web.controller;

import java.security.KeyPair;
import java.security.PublicKey;
import java.util.Optional;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.teamp.web.entity.input.MemberInformation;
import com.teamp.web.service.EmailSenderService;
import com.teamp.web.service.LoginService;
import com.teamp.web.service.MemberService;
import com.teamp.web.util.EncryptionUtil;
import com.teamp.web.util.EncryptionUtilRSA;
import com.teamp.web.util.RandomString;

@Controller
public class LoginController {

	@Autowired
	LoginService loginService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	private EmailSenderService emailSenderService;
	
	private ConcurrentHashMap<String, String> emailVerificationCache = new ConcurrentHashMap<>();

	@GetMapping("/login")
	public String login() {
		System.out.println("접속완료");
		return "login";
	}

	@PostMapping("/login")
	public String login(@RequestParam("id") String id
						, @RequestParam("pw1") String pw1
						, HttpServletRequest request
						, HttpServletResponse response
						, Model model) {
	    MemberInformation member = new MemberInformation();
	    member.setId(id);
	    member.setPw1(pw1);
	    model.addAttribute("id", id);
	    
		try {
			if (loginService.validateMember(member)) {
				int membershipGrade = loginService.findByMembershipGrade(id);
				int membership_status = loginService.findByMembership_status(id);
				System.out.println(membershipGrade + "그레이드");
				// membership_status = 0 회원탈퇴
				if (membership_status != 0) {
					// 멤버쉽등급이 0이 아닐경우
					if (membershipGrade != 0) {
						HttpSession session = request.getSession();
						session.setAttribute("id", id);
						MemberInformation nickname = loginService.findByNickname(id);
						session.setAttribute("nickname", nickname.getNickname());

						return "index";
					} else {
						// 멤버쉽등급이 0일 경우
						model.addAttribute("gradeZero", true);
						return "login";
					}
				} else {
					model.addAttribute("draw", true);
					return "login";
				}
			}else {
					model.addAttribute("loginFailed", true);
					return "login";
				}
		} catch (Exception e) {
			model.addAttribute("loginFailed", true);
			return "login";
		}
			
		
	}
	// 로그아웃
	@GetMapping("/logout")
	public String logout(HttpServletRequest request
						, HttpServletResponse response) {
		HttpSession session = request.getSession();
		if (session.getAttribute("id") != null) {
			session.removeAttribute("id");
		}
		if (session.getAttribute("nickname") != null) {
			session.removeAttribute("nickname");
		}
		// 일괄삭제
//			session.invalidate();
		return "redirect:/login";
	}
	@PostMapping("/mail/re-resend")
	public String resend(@ModelAttribute MemberInformation memberInformation, @RequestParam("id") String id) {
		try {
			String temp = "";
			RandomString rs = new RandomString(35);
			temp = rs.nextString();
			System.out.println(temp + "보내기전");
			System.out.println(id + "dd");
			// id와 key값을 캐시에 저장
			emailVerificationCache.put(id, temp);

			MemberInformation Mnickname = loginService.findByNickname(id);
			MemberInformation MtoEmail = loginService.findByEmail(id);
			String nickname = Mnickname.getNickname();
			String toEmail = MtoEmail.getEmail();

			System.out.println(nickname + "이메일 테스트" + toEmail);
			String subject = "회원가입 이메일 인증 안내";
			String body = "<html><body>안녕하세요. <b>" + nickname + "</b>님 Carina에 회원가입을 해주셔서 감사합니다.<br>"
					+ "아래의 링크를 클릭하시면 회원가입이 완료됩니다.<br>"
					+ "<form id='confirmationForm' method='post' action='http://localhost/join/ok'>"
					+ "<input type='hidden' id='id' name='id' value='" + id + "'/><br>"
					+ "<input type='hidden' id='key' name='key' value='" + temp + "'/><br>"
					+ "<button type='submit'><b>이메일 인증하기</b></button>" + "</form><br>위 링크는 1시간동안만 유효합니다.</body></html>";

			emailSenderService.sendEmail(toEmail, subject, body);

		} catch (Exception e) {
		}
		return "mail";
	}
	@GetMapping("/find")
	public String find() {
		return "find";
	}
	@PostMapping("/forgotId")
	public String forgotId(HttpServletRequest request
			, @ModelAttribute MemberInformation memberInformation
			, @RequestParam("forgotId") String toEmail
			) {
		Optional<MemberInformation> optionalMemberInfo1 = memberService.findByEmail(toEmail);
		MemberInformation existingMemberInfo1 = optionalMemberInfo1.get();
		String id = existingMemberInfo1.getId();
		
		String subject = "[Carina] 아이디 찾기";
		String body = "회원님의 아이디는 : " + id + " 입니다.";

		emailSenderService.sendEmail(toEmail, subject, body);
		
		
		return "login";
	}
	@PostMapping("/forgotPw")
	public String forgotPw(HttpServletRequest request
			, @ModelAttribute MemberInformation memberInformation
			, @RequestParam("forgotPw") String toEmail
			) {
		String temp = "";
		RandomString rs = new RandomString(6);
		temp = rs.nextString();

		try {
			
			Optional<MemberInformation> optionalMemberInfo1 = memberService.findByEmail(toEmail);
			MemberInformation existingMemberInfo1 = optionalMemberInfo1.get();
			
			// 회원정보 입력 전 비밀번호 암호화(RSA)
			KeyPair keyPair = EncryptionUtilRSA.generateKeyPair();
	    	PublicKey publicKey = keyPair.getPublic();
//	        String encryptedPassword = EncryptionUtilRSA.encrypt(temp, publicKey);
			String encryptedPassword = EncryptionUtil.encrypt(temp, "ioio");
            existingMemberInfo1.setPw1(encryptedPassword);
            
            // 업데이트된 memberInformation 정보를 데이터베이스에 다시 저장
            memberService.save(existingMemberInfo1);
			String subject = "[Carina] 비밀번호 찾기";
			String body = "임시 비밀번호  : " + temp;

			emailSenderService.sendEmail(toEmail, subject, body);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "login";
}
	
}
