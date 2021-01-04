package com.olive.hr_management.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.olive.dto.Emp;
import com.olive.hr_management.service.Hr_managementService;

@Controller
@RequestMapping("/Hr_management")
public class Hr_ManagementController {
	
	private Hr_managementService hr_managementService;
	
	@Autowired
	public void setHr_managementService(Hr_managementService hr_managementService) {
		this.hr_managementService = hr_managementService;
	}

	@RequestMapping("EmployeeAccount.do")
	public String employeeAccount(Model model) {
		System.out.println("management 컨트롤러 진입");
		List<Emp> empList = hr_managementService.getEmpList();
		System.out.println("Controller result: "+empList);
		model.addAttribute("empList", empList);
		return "HR_management/EmployeeAccount";
	}
	
	@RequestMapping("Organization.do")
	public String organization() {
		return "HR_management/Organization";
	}
}