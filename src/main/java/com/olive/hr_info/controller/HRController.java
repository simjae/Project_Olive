package com.olive.hr_info.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.olive.dto.Emp;
import com.olive.hr_info.service.Hr_infoService;





@Controller
@RequestMapping("/HRinfo/")
public class HRController {
	
	private Hr_infoService empService;
	@Autowired
	public void setEmpService(Hr_infoService empService) {
		this.empService = empService;
	}
	
	
	
	
	@RequestMapping("Salary.do")
	public String showSalary() {
		
		return "HRinfo/Salary";
		
	}
	
	@RequestMapping(value="Emp.do", method=RequestMethod.GET)
	public String showEmpList(Model model) {
		List<Emp> emplist = empService.showEmpList();
		model.addAttribute("emplist", emplist);
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
