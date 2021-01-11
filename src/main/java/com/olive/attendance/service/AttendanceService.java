/*
	파일명:AttendanceService.java 
	설명: 근태관리 서비스
	작성일 : 2020-12-28 
	수정일 : 2020-01-07
	작성자 : 심재형 
*/

package com.olive.attendance.service;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.olive.attendance.dao.AttendanceDao;
import com.olive.dto.Att_Record;

@Service
public class AttendanceService {
		private SqlSession sqlsession;
	
		@Autowired
		   public void setSqlsession(SqlSession sqlsession) {
		      this.sqlsession = sqlsession;
		      System.out.println(this.sqlsession);
		      System.out.println("연결");
		   }

		public void startwork(int id) {
			AttendanceDao attdao = sqlsession.getMapper(AttendanceDao.class);
		
			int attcode = 0;
			Date tardyDate = new Date();//지각 기준시간 
			Date curDate = new Date();//현재시간 
			SimpleDateFormat dateFormat = new SimpleDateFormat("YYYY-MM-DD HH:mm:ss");//string 날짜형식 정의 
			SimpleDateFormat tardyFormat = new SimpleDateFormat("YYYY-MM-DD 09:00:00");//string 날짜형식 정의 
			String curDatestr = dateFormat.format(curDate);
			String tardyDatestr = dateFormat.format(tardyDate);
	
			
		

			try {
				
				Date tardyDateFormat = dateFormat.parse(tardyDatestr);
				Date curDateFormat = dateFormat.parse(curDatestr);
				if (curDateFormat.getTime() < tardyDateFormat.getTime() ) {
					System.out.println("출근");
					attcode = 10;
					
				} else {
					System.out.println("지각");
					attcode = 20;
				}
				Att_Record att = new Att_Record();
				att.setAttCode(attcode);
				att.setEmpNo(id);
				System.out.println(attcode);
				attdao.startwork(att);
				
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("찍음");
			}
			
		}
		
		
		
//=================== 퇴근 버튼 update ===================// 
		
		
		public void endwork(int id) {
			AttendanceDao attdao = sqlsession.getMapper(AttendanceDao.class);
			int attcode = 70;// 퇴근 근태코드 
			Date curDate = new Date();//현재시간 
			SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");//string 날짜형식 정의 
			String curDatestr = dateFormat.format(curDate);
		   try {
			   	Att_Record att = new Att_Record();
			   	att.setAttCode(attcode);
				att.setEmpNo(id);
				System.out.println(attcode);
				attdao.endwork(att);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}	
		
//=================== 근태 출/퇴근 테이블 select ===================// 
		
		
		public  List<Att_Record> tableList() {
			AttendanceDao tabledao = sqlsession.getMapper(AttendanceDao.class);
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			System.out.println("테이블 ");
			return tabledao.gettableList(auth.getName());
		}


//=================== 근태 캘린더  ===================// 
			
		public List<Att_Record> calendarList () {
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			AttendanceDao caldao = sqlsession.getMapper(AttendanceDao.class);
			System.out.println("넌뭔대"+caldao);
			return caldao.gettableList(auth.getName());			
		}

}
