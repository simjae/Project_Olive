package kr.or.hr.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/attendance/")
public class AttendanceController {
	
	@RequestMapping("attendanceHome.do")
	public String attendanceHome() {
		return "attendance/attendanceHome";
	}
}
