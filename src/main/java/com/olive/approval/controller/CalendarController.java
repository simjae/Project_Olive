/*
® 	파일명:CalendarController.java 
	설명: 캘린더 컨트롤러 
	작성일 : 2020-12-28
	작성자 : 심재형 
*/
package com.olive.approval.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.olive.attendance.service.CalendarService;
import com.olive.dto.Att_Record;
import com.olive.dto.Calendar;

@RestController
public class CalendarController {
	
	private CalendarService calendarservice;
	@Autowired
	public void setCalenderService(CalendarService calendarservice) {
		this.calendarservice = calendarservice ;
	}
	
	//휴가 서비스 
	@RequestMapping(value = "/attendance/calendarList.do", method = RequestMethod.GET)
	public List<Calendar> calendarList() {
		List<Calendar> calendarList = null;
		calendarList = calendarservice.calendarList();
		System.out.println(calendarList);
		return calendarList;
	}
	
}
