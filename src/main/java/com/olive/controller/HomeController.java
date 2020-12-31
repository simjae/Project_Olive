package com.olive.controller;

import java.io.UnsupportedEncodingException;
import java.util.Locale;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.olive.utils.NewsAPI;




@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	

	@RequestMapping(value = "/Login.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {	
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
	
}
