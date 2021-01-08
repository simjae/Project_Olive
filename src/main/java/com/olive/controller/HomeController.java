/*
	파일명: HomeController.java
    설명: 로그인 화면, 알람 및 이메일 인증 관련 매핑을 담당하는 HomeController ( 기능별 분리해야될 수도 있는 소지 ) 
    작성일: 
    작성자: 
    수정자: 백희승
*/
package com.olive.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.velocity.exception.VelocityException;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.velocity.VelocityEngineFactoryBean;
import org.springframework.ui.velocity.VelocityEngineUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.olive.authentication.service.AuthenticationService;
import com.olive.authentication.service.MailService;
import com.olive.dto.Emp;
import com.olive.utils.NewsAPI;

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private VelocityEngineFactoryBean vefb;

	@Autowired
	private MailService mailService;

	@Autowired
	private AuthenticationService authService;
	
	// 최초 index.jsp 접근 시 : Login 페이지
	@RequestMapping("/goToLogin.do")
	public String goToLogin() {
		return "Login";
	}

	// 로그인 시 Main : 대쉬보드 페이지 (LoginForm은 Post, But Security 처리 = GetMapping)
	@RequestMapping(value = "/goToMain.do", method = RequestMethod.GET)
	public String home() {
		try {
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			String n = auth.getName();
			String r = auth.getAuthorities().toString();

			System.out.println("홈컨트롤러 /goToMain - HOME_CONTROLLER_auth.getName() : " + n);
			System.out.println("홈컨트롤러 /goToMain - HOME_CONTROLLER_auth.getAuthroties().toString() : " + r);

		} catch (Exception e) {
			// TODO: handle exception
		}
		return "Main";
	}

	@RequestMapping(value = "/getNewsData.do", method = RequestMethod.GET)
	@ResponseBody
	public JSONObject getNewsData() throws UnsupportedEncodingException {
		NewsAPI newsAPI = new NewsAPI();
		JSONObject result = newsAPI.returnNewsData();
		System.out.println(result);
		return result;
	}

	@RequestMapping(value = "/Alrams.do", method = RequestMethod.GET)
	public String Alram() {
		return "etc/Alrams";
	}

	
	
	
	
	
	@RequestMapping(value = "/registEmail.do", method = RequestMethod.GET)
	public String goToEmail() {
		return "etc/Email";
	}

	// 이메일 입력 > 메일 보내기
	@RequestMapping(value = "/registEmail.do", method = RequestMethod.POST)
	public ResponseEntity<String> registEmail(HttpServletRequest request, String email) {
		ResponseEntity<String> entity = null;
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		HttpSession session = request.getSession();
		if(mailService.sendMail(session, email)) {
			entity = new ResponseEntity<String>("sended", HttpStatus.OK);
		}else{
			entity = new ResponseEntity<String>("failed", HttpStatus.OK);
		}

		return entity;
	}

	// 인증번호 인증
	@RequestMapping(value = "/certificate.do", method = { RequestMethod.POST })
	public ResponseEntity<Boolean> certifyEmail(HttpServletRequest request, Principal principal,
			String inputCode, String email) {
		ResponseEntity<Boolean> entity = null;

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		HttpSession session = request.getSession();
		boolean match = mailService.certifyEmail(session, principal, inputCode);
		
		if (match) {
			entity = new ResponseEntity<Boolean>(true, HttpStatus.OK);
		} else {
			entity = new ResponseEntity<Boolean>(false, HttpStatus.OK);
		}
		return entity;
	}
	
	@RequestMapping(value = "/goToWork.do")
	@ResponseBody
	public String goToWork(Principal principal, String email){
		authService.updateEmail(principal.getName(), email);
		authService.setGeneralRole(principal.getName());
		authService.setActivate(principal.getName());
	
		return "goToMain.do";
	}
	
	//public ResponseEntity<Boolean> 
	
	// 아직 미구현이지만, Access Denied 시 페이지 매핑
	/*
	 * @RequestMapping(value = "/accessDenied.do") public String accessDenied() {
	 * return "403시 넣어줄 주소"; }
	 */

}
