package com.olive.utils.service;

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
}
