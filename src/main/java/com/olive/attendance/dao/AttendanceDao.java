package com.olive.attendance.dao;
/*
	파일명:CalendarDao.java 
	설명: 캘린더 컨트롤러  
	작성일 : 2020-12-28
	작성자 : 심재형 
*/


import org.apache.ibatis.annotations.Param;

public interface AttendanceDao {
	//출근처리 
	public void startwork(@Param("attcode") int attcode);
	//퇴근처리 
	public void endwork();
	
}
