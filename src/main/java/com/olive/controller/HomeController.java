package com.olive.controller;

import java.io.UnsupportedEncodingException;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.olive.dto.Emp;
import com.olive.utils.NewsAPI;

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

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

	// 아직 미구현이지만, Access Denied 시 페이지 매핑
	/*
	 * @RequestMapping(value = "/accessDenied.do") public String accessDenied() {
	 * return "403시 넣어줄 주소"; }
	 */
	
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

}
