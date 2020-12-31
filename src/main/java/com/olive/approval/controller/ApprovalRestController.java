package com.olive.approval.controller;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ApprovalRestController {
	@RequestMapping(value="/approval/preview.do")
	private String preview(String data) {
//		서비스 쪽으로 들어가야함 
		System.out.println(data.toString());
		JSONObject jsonObj = JsonToObjectParser(data.toString());
		System.out.println((String)jsonObj.get("title"));
		return "/papers/vacation";
	}

	private JSONObject JsonToObjectParser(String jsonStr) {
		JSONParser parser = new JSONParser();
		JSONObject obj = null;
		try {
			obj = (JSONObject) parser.parse(jsonStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return obj;
	}

}
