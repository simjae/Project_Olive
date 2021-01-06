/*
	파일명:CalendarService.java 
	설명: 캘린더 서비
	작성일 : 2020-12-28
	작성자 : 심재형 
*/

package com.olive.attendance.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.olive.attendance.dao.AttendanceDao;
import com.olive.attendance.dao.CalendarDao;
import com.olive.dto.Att_Record;
import com.olive.dto.Calendar;

@Service
public class AttendanceService {
		private SqlSession sqlsession;
		
		@Autowired
		   public void setSqlsession(SqlSession sqlsession) {
		      this.sqlsession = sqlsession;
		      System.out.println(this.sqlsession);
		      System.out.println("연결");
		   }
		public void insert(Calendar cal) {
			CalendarDao caldao = sqlsession.getMapper(CalendarDao.class);
			caldao.insert(cal);
			System.out.println("여기옴 ");
			
		}
	
		//출근 update
		public void startwork() throws ParseException {
			AttendanceDao attdao = sqlsession.getMapper(AttendanceDao.class);
			int attcode = 0;
			String tardyDateStr = "09:00:00";// 지정한시간
			Date curDate = new Date();//현재시간 
			SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");//string 날짜형식 정의 
			String curDatestr = dateFormat.format(curDate);
		

			Date tardyDate = dateFormat.parse(tardyDateStr);//시간으로 변경
			Date curDateFormat = dateFormat.parse(curDatestr);
			
			if (curDateFormat.getTime() < tardyDate.getTime() ) {
				System.out.println("출근완료");
				attcode = 10;
				
			} else {
				System.out.println("지각");
				attcode = 20;
			}
			System.out.println(attcode);
			attdao.startwork(attcode);
		}
		//퇴근 
		public void endwork() {
		}
				
		
}
