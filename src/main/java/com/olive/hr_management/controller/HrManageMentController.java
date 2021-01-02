package com.olive.hr_management.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.olive.dto.Emp;
import com.olive.hr_management.service.Hr_managementService;

@Controller
@RequestMapping("/HR_management")
public class HrManageMentController {
	
	@Autowired
	private Hr_managementService service;
	
	@RequestMapping(value="EmployeeAccount.do", method=RequestMethod.GET)
	public String employeeAccount() {
		return "HR_management/EmployeeAccount";
	}
	
	@RequestMapping("Organization.do")
	public String organization() {
		return "HR_management/Organization";
	}
	
	@RequestMapping(value="EmployeeAccount.do", method=RequestMethod.POST)
	public String insertNewAccount(Emp emp) {
		System.out.println(emp);
		/* service.insertNewEmp(emp); */
		List<Emp> list = null;
		list = service.selectAllList();
		System.out.println("출력" + list);
		return "HR_management/EmployeeAccount";
	}
	
	
}
