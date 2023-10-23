package com.dog.save.mail.service.impl;

import java.util.Map;

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
	private static String userMessage;	// 기진 코드
	
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
			body += "<h3>인증번호 입력 칸에 6자리를 입력해주세요.</h3>";
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
	
	
	// 기진 코드
	public MimeMessage CreateUserVoiceMail(Map<String, String> emailParams) {
		MimeMessage message = javaMailSender.createMimeMessage();
		
		try {
			String userName = emailParams.get("userName");
	        String userEmail = emailParams.get("userEmail");
	        String userEmailSubject = emailParams.get("userEmailSubject");
	        String userEmailContent = emailParams.get("userEmailContent");
			
			message.setFrom(userEmail);
			message.setRecipients(MimeMessage.RecipientType.TO, "goflrlwls94@naver.com");
			message.setSubject("To. WIMF '" + userName + "' 님이 보낸 메일입니다.");
			String body = "";
			body += "<h3>";
			body += "• 보내신 분 : " + userName + "<br>";
			body += "• 이메일 : " + userEmail + "<br>";
			body += "• 제목 : " + userEmailSubject + "<br>";
			body += "• 내용 : " + userEmailContent;
			body += "</h3>";
			message.setText(body, "UTF-8", "html");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return message;
	}
	
	@Override
	public String MailSenderToWimfFromUser(Map<String, String> emailParams) {
		MimeMessage message = CreateUserVoiceMail(emailParams);
		javaMailSender.send(message);
		
		return userMessage;
	}
	// 기진 코드

}
