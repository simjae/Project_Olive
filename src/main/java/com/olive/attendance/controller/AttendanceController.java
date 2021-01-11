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
	private Hr_infoService empService;
	

	@RequestMapping("annual.do")
	public String mannual() {
		return "attendance/Annual";
	}
	@RequestMapping(value ="attendance.do", method = RequestMethod.GET)
	public String mattendance(Model model, Criteria cri) {
		  System.out.println("cri 값 초기화 전"+cri);
		  cri.setCriteria("rectable", "empno", "desc");
		  System.out.println("cri 값 초기화 후"+cri);
		  
	    int totalCount = pagingService.getListCount(cri);
	    Pagination pagination = new Pagination(cri, totalCount);
	    
	    List<Map<String, Object>> result = pagingService.getList(cri);
	    System.out.println("[result] : "+result);
	    
	    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		String username = auth.getName();
		System.out.println("emp컨트롤러" +username);
		Map<String, Object> emp = empService.searchEmpByEmpno(username);
		
		model.addAttribute("emp", emp);
	    model.addAttribute("list", result);
	    model.addAttribute("pagination", pagination);
	    model.addAttribute("criteria", cri);
		
		return "attendance/Attendance";
	}

}