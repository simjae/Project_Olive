package com.olive.approval.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/approval/")
public class ApprovalController {
	@RequestMapping(value = "approvalHome.do", method = RequestMethod.GET)
	public String approvalHome() {
		
		return "approval/approvalHome";
	}
	
	@RequestMapping(value = "DocWrite.do", method = RequestMethod.GET)
	public String DocWrite(Model model) {
		Date nowTime = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일");
		model.addAttribute("time", sf.format(nowTime));
		
		return "approval/DocWirte";
	}
	
	@RequestMapping(value = "PersonalDoc.do", method = RequestMethod.GET)
	public String showPersonalDoc() {
		
		return "approval/PersonalDoc";
	}
	
	@RequestMapping(value = "ProgressDoc.do", method = RequestMethod.GET)
	public String showPregressDoc() {
		
		return "approval/ProgressDoc";
	}
}
