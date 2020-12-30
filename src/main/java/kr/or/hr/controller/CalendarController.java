package kr.or.hr.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.hr.dto.Calendar;
import kr.or.hr.service.CalendarService;

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
		return "redirect :calendar.do";
	}

}
