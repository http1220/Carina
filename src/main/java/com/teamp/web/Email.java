package com.teamp.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.teamp.web.service.EmailSenderService;

@SpringBootApplication
public class Email {
	@Autowired
	private EmailSenderService senderService;
	
	public static void main(String[] args) {
		SpringApplication.run(Email.class, args);
	}
//	@EventListener(ApplicationReadyEvent.class)
//	public void sendMail() {
//		senderService.sendEmail("sung0763@naver.com", "test", "테스트");
//	}
}
