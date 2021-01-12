package com.olive.utils.controller;

import java.util.List;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.olive.dto.Alarm;

@RestController
public class AlarmRestController {
	
	@RequestMapping(value="modalAlarm.do")
	public List<Alarm> getAlarmModal(Alarm alarm){
		
		return null;
	}
}
