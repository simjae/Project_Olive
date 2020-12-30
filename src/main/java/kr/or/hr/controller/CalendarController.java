package kr.or.hr.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.hr.dto.Calendar;

@Controller
public class CalendarController {
	
	@RequestMapping(value = "calendar.do", method = RequestMethod.GET)
	public String calendarInsert(Calendar cal){
		System.out.println(cal.getStartdate());
		System.out.println(cal.getEnddate());
		System.out.println(cal.getContext());
		return null;
	}

}
