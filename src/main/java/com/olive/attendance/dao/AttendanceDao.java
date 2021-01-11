/*
	파일명:AttendanceDao.java 
	설명: 근태관리 dao  
	작성일 : 2020-12-28 
	수정일 : 2020-01-07
	작성자 : 심재형 
 */
package com.olive.attendance.dao;



import java.util.List;

import com.olive.dto.Att_Record;
import com.olive.dto.Document;


public interface AttendanceDao {
	//출근처리 
	public void startwork(Att_Record attrecord);
	//퇴근처리 
	public void endwork(Att_Record attrecord);

	//근태관리 테이블/캘린더 select
	public List<Att_Record> gettableList(String empno);
	
	//근태관리 테이블/캘린더 select
	public List<Document> getanaltableList(String empno);
	
	}
	

