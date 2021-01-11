/*
	파일명:AttendanceService.java 
	설명: 근태관리 서비스
	작성일 : 2020-12-28 
	수정일 : 2020-01-07
	작성자 : 심재형 
*/

package com.olive.attendance.service;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.olive.attendance.dao.AttendanceDao;
import com.olive.dto.Document;

@Service
public class AnnualService {
		private SqlSession sqlsession;
	
		@Autowired
		   public void setSqlsession(SqlSession sqlsession) {
		      this.sqlsession = sqlsession;
		      System.out.println(this.sqlsession);
		      System.out.println("연결");
		   }

	

//=================== 휴가 캘린더  ===================// 
			
		public List<Document> calendarList () {
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			AttendanceDao caldao = sqlsession.getMapper(AttendanceDao.class);
			System.out.println(caldao);
			return caldao.getanaltableList(auth.getName());			
		}

}