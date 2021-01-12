package com.olive.utils.dao;

import java.util.List;

import com.olive.dto.Alarm;

public interface AlarmDao {
	public void insertAlarm(Alarm al);
	public List<Alarm> getAlarmList(String empno,int start,int end);
}
