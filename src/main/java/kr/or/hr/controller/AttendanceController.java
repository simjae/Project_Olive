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
	@RequestMapping("Annual.do")
	public String  Annual() {
		return "attendance/Annual";
	}
	@RequestMapping("M_attendance.do")
	public String Mattendance() {
		return "attendance/M_attendance";
	}
	@RequestMapping("M_annual.do")
	public String Mannual() {
		return "attendance/M_annual";
	}
	
}
