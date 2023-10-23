package com.dog.save.mail.service;

import java.util.Map;

public interface MailService {

	/**
	 * 이메일 인증
	 * @param mail
	 * @return int
	 */
	int sendMail(String mail);

	// 기진 코드
	/**
	 * 이메일 보내기
	 * @param emailParams
	 * @return
	 */
	String MailSenderToWimfFromUser(Map<String, String> emailParams);
	// 기진 코드

}
