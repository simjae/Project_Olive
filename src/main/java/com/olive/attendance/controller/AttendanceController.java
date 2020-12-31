package com.olive.attendance.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/attendance/")
public class AttendanceController {
	
	@RequestMapping("attendanceHome.do")
	public String attendanceHome() {
		return "attendance/attendanceHome";
	}
	@RequestMapping("annual.do")
	public String annual() {
		return "attendance/Annual";
	}
	@RequestMapping("mannual.do")
	public String mannual() {
		return "attendance/M_annual";
	}
	@RequestMapping("mattendance.do")
	public String mattendance() {
		return "attendance/M_attendance";
	}
}
