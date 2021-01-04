package com.olive.hr_info.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/HRinfo/")
public class HRController {
	
	@RequestMapping("Salary.do")
	public String showSalary() {	
		return "HRinfo/Salary";
	}
	
	@RequestMapping("SalaryDetail.do")
	public String showSalaryDetail() {	
		return "HRinfo/salaryDetail";
	}
	
	
	@RequestMapping("Emp.do")
	public String showEmp() {
		
		return "HRinfo/Emp";
		
	}
	
	@RequestMapping("Organization_chart.do")
	public String showOrganization() {
		
		return "HRinfo/Organization_chart";
		
	}
	
	@RequestMapping("EditMyinfo.do")
	public String editMyinfo() {
		
		return "HRinfo/EditMyinfo";
		
	}
	
}
