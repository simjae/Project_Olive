package com.olive.controller;

import java.io.UnsupportedEncodingException;
import java.util.Locale;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.olive.dto.Emp;
import com.olive.utils.NewsAPI;

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/Login.do", method = RequestMethod.GET)
	public String home() {
		try {
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			String n = auth.getName();
			String r = auth.getAuthorities().toString();

			System.out.println("the value of username is " + n);
			System.out.println("the value of role is  " + r);

		} catch (Exception e) {
			// TODO: handle exception
		}

		return "index";
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

}
