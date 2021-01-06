package com.olive.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Att_Record {
	private Date date;
	private int empNo;
	private Date start;
	private Date end;
	private int attCode;
	private String title;
}
