package com.olive.hr_info.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.olive.dto.DeptTest;
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
	
	@RequestMapping("SalaryDetail.do")
	public String showSalaryDetail() {	
		return "HRinfo/salaryDetail";
	}

	//전체 사원 목록 조회
	@RequestMapping(value="Emp.do", method=RequestMethod.GET)
	public String showEmpList(Model model) {
		List<Emp> emplist = empService.showEmpList();
		model.addAttribute("emplist", emplist);
		return "HRinfo/Emp";
	}
	
	//조직도 본부 단위 (default)
	@RequestMapping(value="Organization_chart.do", method=RequestMethod.GET)
	public String showOrg(Model model) {
		List<DeptTest> headlist = empService.showOrg();
		model.addAttribute("head", headlist);
		return "HRinfo/Organization_chart";
	}
	
	@RequestMapping("EditMyinfo.do")
	public String editMyinfo() {
		
		return "HRinfo/EditMyinfo";
		
	}
	
}
