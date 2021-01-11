/*
	파일명:AttendanceRestController.java 
	설명: 근태관리 컨트롤러
	작성일 : 2020-12-28   
	수정일 : 2020-01-07
	작성자 : 심재형 
 */
package com.olive.attendance.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.mysql.cj.Session;
import com.olive.attendance.service.AttendanceService;
import com.olive.dto.Att_Record;
import com.olive.dto.Emp;

import paging.Criteria;
import paging.Pagination;
import paging.PagingService;


@RestController
@RequestMapping("/attendance/")
public class AttendanceRestController {
	 
	private AttendanceService service;
	@Autowired
	public void setAttendanceService(AttendanceService attendanceservice) {
		this.service = attendanceservice ;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
	@Autowired
	private PagingService pagingService;
	
//=================== 출근버튼 ===================// 
	
	
	@RequestMapping(value = "startwork.do", method = RequestMethod.GET)	 
	public void startWork(){
		System.out.println("탐 ");
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			int id = Integer.parseInt(auth.getName());
			System.out.println(id);
			service.startwork(id);
			System.out.println("출근버튼 서비스들어가기전 ");
		}
	
	
//=================== 퇴근버튼 ===================// 
	
	@RequestMapping(value = "endwork.do", method = RequestMethod.GET)	 
	public void endWork(){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		int id = Integer.parseInt(auth.getName());
		System.out.println("퇴근하기 컨트롤러1");
		service.endwork(id);
		System.err.println("컨트롤러에서 서비스로 id들고감 ");
	}

	
//=================== 근태 출/퇴근 테이블 select ===================// 

	
	@RequestMapping(value = "attTableList.do", method = RequestMethod.GET)	 
	public List<Att_Record> attTableList() {
		List<Att_Record > tableList = null ;
		tableList  = service.tableList();
		System.out.println("서비스에서가져옴 ");
		return  tableList;	
	}
	

//=================== 근태 캘린더 select ===================// 
	
	
	@ResponseBody
	@RequestMapping(value = "calendarList.do", method = RequestMethod.GET)
	public List<Att_Record> calendarList() {
		List<Att_Record> calendarList = null;
		System.out.println("1");
		calendarList = service.calendarList();
		System.out.println("캘린더리스트"+calendarList);
		return calendarList;
	}		
	
//=================== 근태 테이블테스트  ===================// 
@RequestMapping(value = "attPage.do", method = RequestMethod.POST)
public JSONObject attPage(Criteria cri) {
		
		cri.setCriteria("rectable", "empno", "desc");
		int totalCount = pagingService.getListCount(cri);
		Pagination pagination = new Pagination(cri, totalCount);
		List<Map<String, Object>> result = pagingService.getList(cri);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("list", result);
		jsonObject.put("pagination", pagination);
		jsonObject.put("criteria", cri);
	
	
	
	return jsonObject;
	
}
	
	

}
	


