package com.dog.save.mail.service;

public interface MailService {

	/**
	 * 이메일 인증
	 * @param mail
	 * @return int
	 */
	int sendMail(String mail);

}
