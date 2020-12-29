package kr.or.hr.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

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
	public String DocWrite() {

		return "approval/DocWirte";
	}
}
