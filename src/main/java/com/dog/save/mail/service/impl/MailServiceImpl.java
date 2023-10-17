package com.dog.save.mail.service.impl;

import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.dog.save.mail.service.MailService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MailServiceImpl implements MailService{

	private final JavaMailSender javaMailSender;
	private static int number;
	
	public static void createRandomNum() {
		number = (int)(Math.random() * (900000)) + 100000;
	}
	
	public MimeMessage CreateMail(String mail) {
		createRandomNum();
		MimeMessage message = javaMailSender.createMimeMessage();
		
		try {
			message.setFrom("cvb05055@gmail.com");
			message.setRecipients(MimeMessage.RecipientType.TO, mail);
			message.setSubject("WIMF 이메일 인증번호");
			String body = "";
			body += "<h3>이메일 인증번호</h3>";
			body += "<h1>" + number + "</h1>";
			body += "<h3>인증번호 입력 칸에 6자리를 입력해주세요.";
			message.setText(body, "UTF-8", "html");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return message;
	}
	
	@Override
	public int sendMail(String mail) {
		MimeMessage message = CreateMail(mail);
		javaMailSender.send(message);
		
		return number;
	}

}
