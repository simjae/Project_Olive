/*
® 	파일명:CalendarController.java 
	설명: 캘린더 컨트롤러 
	작성일 : 2020-12-28
	작성자 : 심재형 
*/
package com.olive.approval.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.olive.attendance.service.CalendarService;
import com.olive.dto.Calendar;

@Controller
public class CalendarController {
	
	private CalendarService calendarservice;
	@Autowired
	public void setCalenderService(CalendarService calendarservice) {
		this.calendarservice = calendarservice ;
	}
	
	@RequestMapping(value = "calendar.do", method = RequestMethod.GET)
	public String calendarInsert(Calendar cal){
		System.out.println(cal.getStartdate());
		System.out.println(cal.getEnddate());
		System.out.println(cal.getContext());
		calendarservice.insert(cal);
		
		return "redirect:attendance/mannual.do";
	}
	@RequestMapping(value = "calendarList.do", method = RequestMethod.GET)
	public List<Calendar> calendarList() {
		List<Calendar> calendarList = null;
		calendarList = CalendarService.calendarList();
		return calendarList;
		
		
	}
}
