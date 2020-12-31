package com.olive.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Alarm {
	private int alarmNo;
	private Date alramTime;
	private int empNo;
	private String Content;
	private boolean alarmCheck;
}
