package kr.or.hr.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/HRinfo/")
public class HRController {
	@RequestMapping("Salary.do")
	public String showSalary() {
		return "HRinfo/Salary";
	}
	
}
