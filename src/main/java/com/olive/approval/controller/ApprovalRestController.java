package com.olive.approval.controller;

import java.security.Principal;
import java.util.List;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.olive.approval.service.ApprovalService;
import com.olive.dto.Dept;
import com.olive.dto.Document;
import com.olive.dto.Emp;
import com.olive.dto.Head;

@RestController
@RequestMapping("/approval/")
public class ApprovalRestController {

	private ApprovalService approvalService;

	@Autowired
	public void setApprovalService(ApprovalService approvalService) {
		this.approvalService = approvalService;
	}

	@RequestMapping(value = "/preview.do")
	private String preview(String data) {
//		서비스 쪽으로 들어가야함 
		System.out.println(data.toString());
		JSONObject jsonObj = JsonToObjectParser(data.toString());
		System.out.println((String) jsonObj.get("title"));
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

	@RequestMapping(value = "/getAllEmpList.do")
	private List<Emp> getAllEmpList() {
		
		return approvalService.getAllEmpList();
	}
	@RequestMapping(value = "/getAllDeptList.do")
	private List<Dept> getAllDeptList() {
		
		return approvalService.getAllDeptList();
	}

	@RequestMapping(value = "/getAllHeadList.do")
	private List<Head> getAllHeadList() {
		
		return approvalService.getAllHeadList();
	}
	
	@RequestMapping(value="/getArrangedDocList.do")
	private List<Document> getArrangedDocList(String statusCode,Principal principal) {
		
		return approvalService.getArrangedDocList(statusCode,principal);
	}

}
