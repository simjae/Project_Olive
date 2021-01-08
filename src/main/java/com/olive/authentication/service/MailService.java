/*
	파일명: MailService.java
    설명: HomeController에서 신입사원 로그인 시 Mail 담당 Service 
    작성일: 2021-01-07
    작성자: 백희승
*/
package com.olive.authentication.service;

import java.io.IOException;
import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.apache.velocity.exception.VelocityException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.ui.velocity.VelocityEngineFactoryBean;
import org.springframework.ui.velocity.VelocityEngineUtils;

@Service
public class MailService {

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private VelocityEngineFactoryBean velocityEngineFactoryBean;

	// 이메일 인증번호 보내기
	public boolean sendMail(HttpSession session, String email) {
		boolean flag = true;

		// 6자리 랜덤 정수
		int certNumber = (int) ((Math.random() * 99999) + 100000);

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			Map model = new HashMap<String, String>();

			model.put("certNumber", certNumber);

			messageHelper.setFrom("tivkfzlzl@gmail.com", "Adminstrator");
			// 받는 사람 지정 : 사원
			messageHelper.setTo(email);
			// 제목 지정
			messageHelper.setSubject("회원가입 인증번호");

			String mailBody = VelocityEngineUtils.mergeTemplateIntoString(
					velocityEngineFactoryBean.createVelocityEngine(), "mail.vm", "UTF-8", model);
			// HTML을 보낼 것이다.
			messageHelper.setText(mailBody, true);

			mailSender.send(message);

			session.setAttribute("certNumber", certNumber);

		} catch (MessagingException e) {
			flag = false;
			System.out.println("홈 컨트롤러 메일 등록 오류 : " + e.getMessage());
			e.printStackTrace();
		} catch (VelocityException e) {
			flag = false;
			System.out.println("홈 컨트롤러 메일 등록 오류 : " + e.getMessage());
			e.printStackTrace();
		} catch (IOException e) {
			flag = false;
			System.out.println("홈 컨트롤러 메일 등록 오류 : " + e.getMessage());
			e.printStackTrace();
		} catch (Exception e) {
			flag = false;
			System.out.println("홈 컨트롤러 메일 등록 오류 : " + e.getMessage());
			e.printStackTrace();
		}

		return flag;
	}

	// 이메일 인증번호 인증
	public boolean certifyEmail(HttpSession session, Principal principal, String inputCode) {

		boolean result = false;

		int generationCode = (int) session.getAttribute("certNumber");
		System.out.println("생성된 인증번호 : >" + generationCode + "<");
		System.out.println("입력한 인증번호 : >" + inputCode + "<");
		System.out.println("비교 결과 :" + (Integer.toString(generationCode)).equals(inputCode));
		// 사용자단에서 빈문자 막기
		if ((Integer.toString(generationCode)).equals(inputCode)) {
			result = true;
		}
		return result;
	}

}
