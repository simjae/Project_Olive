package com.olive.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Document {
	private int docNo;
	private int empNo;
	private Date writeDate;
	private String content;
	private int total_Approval;
	private int curr_Approval;
	private String filename;
	private int docStatusCode;
}
