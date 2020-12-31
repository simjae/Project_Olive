package com.olive.attendance.dao;
/*
	파일명:CalendarDao.java 
	설명: 캘린더 컨트롤러  
	작성일 : 2020-12-28
	작성자 : 심재형 
*/


import com.olive.dto.Calendar;

public interface CalendarDao {

	public void insert(Calendar cal);

	public void selectlist(Calendar cal);
}
