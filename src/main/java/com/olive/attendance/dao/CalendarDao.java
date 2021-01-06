package com.olive.attendance.dao;
/*
	파일명:CalendarDao.java 
	설명: 캘린더 컨트롤러  
	작성일 : 2020-12-28
	작성자 : 심재형 
*/


import java.util.List;

import com.olive.dto.Att_Record;
import com.olive.dto.Calendar;

public interface CalendarDao {
	//인설트 
	public void insert(Calendar cal);
	//출근처리 
	public void startwork();
	//휴가 리스트 
	public List<Calendar> getcalendarList();
}
