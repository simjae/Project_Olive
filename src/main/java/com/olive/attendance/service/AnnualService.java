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
			AttendanceDao analcaldao = sqlsession.getMapper(AttendanceDao.class);
			System.out.println("뭐가나옴"+analcaldao);
			return analcaldao.getanaltableList(auth.getName());			
		}



		public List<Document> annualUser(String empno) {
			AttendanceDao annualUser = sqlsession.getMapper(AttendanceDao.class);
			//눌렀을때 누른 클래스 empno 값이  mapper empno에 들어가야함
			//mapper empno가 jsp에서 누르면 empno가 mapper empno 들어가서 찾고 다시가지고옴 
			
			System.out.println("유저만 가지고오니?" + annualUser);
			
			return annualUser.getanaltableList(empno);
		}

}
