/*
	파일명:CalendarService.java 
	설명: 캘린더 서비
	작성일 : 2020-12-28
	작성자 : 심재형 
*/

package com.olive.attendance.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.olive.attendance.dao.CalendarDao;
import com.olive.dto.Calendar;

@Service
public class CalendarService {
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
				
		
}
