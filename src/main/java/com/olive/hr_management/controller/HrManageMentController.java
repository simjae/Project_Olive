package com.olive.hr_management.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/HR_management")
public class HrManageMentController {
	
	@RequestMapping("EmployeeAccount.do")
	public String employeeAccount() {
		return "HR_management/EmployeeAccount";
	}
	
	@RequestMapping("Organization.do")
	public String organization() {
		return "HR_management/Organization";
	}
}
