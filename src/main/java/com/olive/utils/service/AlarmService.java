package com.olive.utils.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.olive.dto.Alarm;
import com.olive.utils.dao.AlarmDao;

@Service
public class AlarmService {
	@Autowired
	private SqlSession sqlsession;
	
	public void insertAlarm(Alarm al) {
		AlarmDao alarmDao = sqlsession.getMapper(AlarmDao.class);
		alarmDao.insertAlarm(al);
	}
	
	public List<Alarm> getAlarmList(String empno,int index){
		AlarmDao alarmDao  = sqlsession.getMapper(AlarmDao.class);
		int size = 5;
		int start = (index == 0) ? 1 : (index-1)*size;
		int end = index*size;
		return alarmDao.getAlarmList(empno,start,end);
	}
	
	
}
