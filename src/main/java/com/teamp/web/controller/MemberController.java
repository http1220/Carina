package com.teamp.web.controller;

import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamp.web.entity.input.MemberInformation;
import com.teamp.web.service.EmailSenderService;
import com.teamp.web.service.MemberService;
import com.teamp.web.util.EncryptionUtil;
import com.teamp.web.util.RandomString;
@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	private EmailSenderService emailSenderService;
	
	private ConcurrentHashMap<String, String> emailVerificationCache = new ConcurrentHashMap<>();
	
	@PostMapping("/checkID")
	@ResponseBody
    public String checkID(@RequestParam("id") String id) {
        int result = memberService.checkID(id);
        return result + "";
    }
	@PostMapping("/checkNickname")
	@ResponseBody
    public String checkNickname(@RequestParam("nickname") String nickname) {
        int result = memberService.checkNickname(nickname);
        return result + "";
    }
	@PostMapping("/checkEmail")
	@ResponseBody
    public String checkEmail(@RequestParam("email") String email) {
        int result = memberService.checkEmail(email);
        return result + "";
    }
	@GetMapping("/agree")
	public String agree(HttpSession session) {
		session.invalidate();
		return "agree";
	}
	@PostMapping("/join2")
	public String join2(HttpServletResponse response) {
		//Cache-Control 헤더는 클라이언트에 캐싱 지시문을 지정하는 데 사용됩니다. 이 예에서 제공되는 지시문은 다음과 같습니다.
		//no-store: 응답의 어떤 부분도 캐시나 중간 캐시에 저장하지 않도록 클라이언트에 지시합니다.
		//no-cache: 서버에서 먼저 재확인하지 않고 응답의 캐시된 버전을 사용해서는 안 된다고 클라이언트에 지시합니다.
		//must-revalidate: 캐시된 응답이 오래되면 서버에서 재검증해야 함을 클라이언트에 지시합니다.
		//max-age=0: 응답이 신선한 것으로 간주되는 최대 시간(초)을 지정합니다. 0으로 설정하면 응답이 즉시 부실해집니다.
		response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate, max-age=0");
		//Pragma 헤더는 캐싱 지시문을 지정하는 데 사용되는 이전 HTTP/1.0 헤더입니다. 이 경우 'no-cache' 지시문이 제공됩니다. 
		//즉, 클라이언트는 서버에서 먼저 유효성을 다시 검사하지 않고 응답의 캐시된 버전을 사용해서는 안 됩니다. 
		//이 헤더는 주로 Cache-Control 헤더를 이해하지 못할 수 있는 이전 클라이언트와의 역호환성을 위해 포함됩니다.
	    response.setHeader("Pragma", "no-cache");
	    //'Expires' 헤더는 응답이 오래된 것으로 간주되는 날짜와 시간을 지정하는 데 사용됩니다. 에 의해
	    response.setHeader("Expires", "0");
		return "join2";
	}
	@PostMapping("/mail")
	public String mail(HttpServletRequest request
					, @ModelAttribute MemberInformation memberInformation
					, @RequestParam("email") String toEmail
					, @RequestParam("id") String id
					, @RequestParam("nickname") String nickname
					, Model model
					) {
	    try {
	    	String temp = "";
	    	RandomString rs = new RandomString(35);
	    	temp = rs.nextString();
	    	System.out.println(temp+"보내기전");
	    	
	    	// 회원정보 입력 전 비밀번호 암호화(AES)
	        String encryptedPassword = EncryptionUtil.encrypt(memberInformation.getPw1(), "ioio");
	        memberInformation.setPw1(encryptedPassword);
	    	
	     // 회원정보 입력 전 비밀번호 암호화(RSA)와 공개키 개인키 생성
//	        KeyPair keyPair = EncryptionUtilRSA.generateKeyPair();
//	        PublicKey publicKey = keyPair.getPublic();
//	        PrivateKey privateKey = keyPair.getPrivate();
//
//	        String publicKeyString = Base64.getEncoder().encodeToString(publicKey.getEncoded());
//	        String privateKeyString = Base64.getEncoder().encodeToString(privateKey.getEncoded());
//
//	        String encryptedPassword = EncryptionUtilRSA.encrypt(memberInformation.getPw1(), publicKey);
//	        memberInformation.setPw1(encryptedPassword);
//	        memberInformation.setPublicKey(publicKeyString);
//	        memberInformation.setPrivateKey(privateKeyString);
	    	
	    	
	    	
	    	memberService.insertMember(memberInformation);
	    	
	    	// id와 key값을 캐시에 저장
	    	emailVerificationCache.put(id, temp); 
	    	
	    	String subject = "회원가입 이메일 인증 안내";
	        String body = "<html><body>안녕하세요. <b>"+ nickname + "</b>님 Carina에 회원가입을 해주셔서 감사합니다.<br>"+"아래의 링크를 클릭하시면 회원가입이 완료됩니다.<br>"
	        		+ "<form id='confirmationForm' method='post' action='http://localhost/join/ok'>"
	        		+ "<input type='hidden' id='id' name='id' value='"+id+"'/><br>"
	        		+ "<input type='hidden' id='key' name='key' value='"+temp+"'/><br>"
	        		+ "<button type='submit'><b>이메일 인증하기</b></button>"
	        		+ "</form><br>위 링크는 1시간동안만 유효합니다.</body></html>";

	        emailSenderService.sendEmail(toEmail, subject, body);
	        
	        model.addAttribute("id", id);
	        model.addAttribute("email", toEmail);
	        model.addAttribute("nickname", nickname);
			} catch (Exception e) {
				model.addAttribute("error", e.getMessage());
			}
			return "mail";
	}
	@ResponseBody
	@PostMapping("/mail/resend")
	public String resend(HttpServletRequest request
			, @ModelAttribute MemberInformation memberInformation
			, @RequestParam("toEmail") String toEmail
			, @RequestParam("id") String id
			, @RequestParam("nickname") String nickname
			) {
		try {
			String temp = "";
			RandomString rs = new RandomString(35);
			temp = rs.nextString();
			System.out.println(temp+"보내기전");
			
			// id와 key값을 캐시에 저장
	    	emailVerificationCache.put(id, temp); 
			
			String subject = "회원가입 이메일 인증 안내";
			String body = "<html><body>안녕하세요. <b>"+ nickname + "</b>님 Carina에 회원가입을 해주셔서 감사합니다.<br>"+"아래의 링크를 클릭하시면 회원가입이 완료됩니다.<br>"
					+ "<form id='confirmationForm' method='post' action='http://localhost/join/ok'>"
					+ "<input type='hidden' id='id' name='id' value='"+id+"'/><br>"
					+ "<input type='hidden' id='key' name='key' value='"+temp+"'/><br>"
					+ "<button type='submit'><b>이메일 인증하기</b></button>"
					+ "</form><br>위 링크는 1시간동안만 유효합니다.</body></html>";
			
			emailSenderService.sendEmail(toEmail, subject, body);
			
		} catch (Exception e) {
		}
		return "mail";
	}
	@PostMapping("/join/ok")
	public String ok(@ModelAttribute MemberInformation memberInformation
	, @RequestParam("id") String id
	, @RequestParam("key") String key
	) {
		Optional<MemberInformation> optionalMemberInfo = memberService.findById(id);
	    // 현재 시간
	    LocalDateTime now = LocalDateTime.now();
	    // formatting
	    String formattedNow = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
	    
	    MemberInformation existingMemberInfo = optionalMemberInfo.get();
	    var time = existingMemberInfo.getJoinDate();
	    LocalDateTime timestamp = LocalDateTime.parse(time.toString(), DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.S"));
	    // 1시간 이상 차이나는지 체크
	    long diffInMinutes = Duration.between(timestamp, now).toMinutes();
	    if (diffInMinutes > 60) {
	        System.out.println("1시간 지남.");
	        return "later";
	    } else {
	    	System.out.println(id);
			System.out.println(key);
			
			// 캐시에서 id를 사용해 key값 불러오기
			String cachedKey = emailVerificationCache.get(id); 
		    if (cachedKey != null && cachedKey.equals(key)) {
		        // 데이터베이스에서 지정된 ID로 memberInformation 정보 로드
		        Optional<MemberInformation> optionalMemberInfo1 = memberService.findById(id);
		        
		        // memberInformation 정보가 있는지 확인합니다
		        if (optionalMemberInfo1.isPresent()) {
		            // 로드된 memberInformation 정보의 MembershipGrade 업데이트
		            MemberInformation existingMemberInfo1 = optionalMemberInfo1.get();
		            existingMemberInfo1.setMembershipGrade(1);
		            
		            // 업데이트된 memberInformation 정보를 데이터베이스에 다시 저장
		            memberService.save(existingMemberInfo1);
		        } else {
		            // memberInformation 정보를 찾을 수 없는 경우 처리
		        	System.out.println("회원정보에서 해당 id를 찾을 수 없습니다. : " + id);
		        	return "invalidId";
		        }
		    }else {
		        // key값이 유효하지 않거나 캐시에서 key값을 찾을 수 없을 경우 처리
		    	System.out.println("key값이 유효하지 않습니다. : " + key );
		    	return "invalidKey";
		    }
	        System.out.println("1시간 지나지 않음.");
	    }
	    return "ok";
	}
	
	
	
	
	
	
	
	
	
	
	//테스트
//	@GetMapping("/join")
//	public String join() {
//		return "join";
//	}
//	@PostMapping("/memberRegist")
//	public String memberRegist(@ModelAttribute MemberInformation memberInformation) {
//			memberService.insertMember(memberInformation);
//		return "login";
//	}
}
