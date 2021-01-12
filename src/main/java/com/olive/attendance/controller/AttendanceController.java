/*
	파일명:AttendanceController.java 
	설명: 근태관리 컨트롤러 뷰페이지 전달 
	작성일 : 2020-12-28 
	수정일 : 2020-01-07
	작성자 : 심재형 
*/
package com.olive.attendance.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.olive.attendance.service.AttendanceService;
import com.olive.dto.Att_Record;
import com.olive.dto.WorkHourPerWeek;
import com.olive.hr_info.service.Hr_infoService;

import paging.Criteria;
import paging.Pagination;
import paging.PagingService;

@Controller
@RequestMapping("/attendance/")
public class AttendanceController {
	@Autowired
	private PagingService pagingService;

	@Autowired
	private AttendanceService attendanceService;

	@Autowired
	private Hr_infoService empService;

	@RequestMapping("annual.do")

	public String mannual(Model model, Criteria cri) {
		System.out.println("cri 값 초기화 전" + cri);
		cri.setCriteria("annaul_diff", "docno", "desc");
		System.out.println("cri 값 초기화 후" + cri);

		int totalCount = pagingService.getListCount(cri);
		Pagination pagination = new Pagination(cri, totalCount);
		List<Map<String, Object>> result = pagingService.getList(cri);
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		String username = auth.getName();
		System.out.println("emp컨트롤러" + username);
		Map<String, Object> emp = empService.searchEmpByEmpno(username);

		model.addAttribute("emp", emp);
		model.addAttribute("list", result);
		model.addAttribute("pagination", pagination);
		model.addAttribute("criteria", cri);
		System.out.println("휴가관리" + result);
		return "attendance/Annual";
	}

	@RequestMapping(value = "attendance.do", method = RequestMethod.GET)
	public String mattendance(Model model, Criteria cri) {
		cri.setCriteria("rectable", "date", "desc");
		int totalCount = pagingService.getListCount(cri);
		Pagination pagination = new Pagination(cri, totalCount);

		List<Map<String, Object>> result = pagingService.getList(cri);
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username = auth.getName();
		Map<String, Object> emp = empService.searchEmpByEmpno(username);
		WorkHourPerWeek workHours = attendanceService.getHoursPerWeek(username);
		List<Att_Record> hoursEachList = attendanceService.getHoursEachDays(username);
		
		model.addAttribute("emp", emp);
		model.addAttribute("list", result);
		model.addAttribute("pagination", pagination);
		model.addAttribute("criteria", cri);
		model.addAttribute("workHours", workHours);
		model.addAttribute("hoursEachList", hoursEachList);

		System.out.println("근태관리" + result);
		System.out.println("\n****\nAttendanceController [주 총 근무시간] >> " + workHours);
		System.out.println("AttendanceController [주 요일별 근무시간] >> " + hoursEachList + "\n****\n");

		return "attendance/Attendance";
	}

}
