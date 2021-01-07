package com.olive.attendance.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.olive.attendance.service.AttendanceService;
import com.olive.attendance.service.CalendarService;
import com.olive.dto.Att_Record;


@RestController
@RequestMapping("/attendance/")
public class AttendanceRestController {
	 
	private AttendanceService attendanceservice;
	@Autowired
	public void setAttendanceService(AttendanceService attendanceservice) {
		this.attendanceservice = attendanceservice ;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
	
	//출근 
	@RequestMapping(value = "startwork.do", method = RequestMethod.GET)	 
	public void startWork(){
		System.out.println("탐 ");
		try {
			
			attendanceservice.startwork();
			System.out.println("서비스들어가기전 ");
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
			
	//1. ㅊㅜㄹ근 버튼 누른다.
	//1-1 . 정해놓은 시간과 현재 시간을 비교해서 ㅈ출근이지 지각인지 구분한다.
	//2. 컨트롤러 타고 현재시간 업데이트 한다.
		//컨트롤러에서는 서비스로 보내기만 하고 , 서비스에서 하는거임 시간비교는
	
			
	//3. 지각 여부 업데이트 한다.
	//UPDATE ACC_RECORED SET STRATTIME =NOW(), ATTCODE=${PARAM1} WHERE EMPNO = ${PARAM2} 
	//1. 세션 2. 화면에 어디 있는거 들고오기 , 3. PRINCIPAL 객체 파라미터로 받아서 PRINCIAPL.GETNAME() 하기
		
		//서비스에서 시간 비교 해서 IF (현재시간>정해놓은 시간 )=> ATTCODE =10 ELSEIF( 반대) ==> ATOOCODE =20
		//DAO(ATTCODE,EMPNO)
	}
	


