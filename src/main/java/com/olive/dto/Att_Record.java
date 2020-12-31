package com.olive.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Att_Record {
	private Date today;
	private int empNo;
	private Date startTime;
	private Date endTime;
	private int AttCode;
}
