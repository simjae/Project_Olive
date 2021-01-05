package com.olive.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Approver {
	private int docNo;
	private int app_Order;
	private int app_Check;
	private Date app_Date;
	private String reply;
	private int empNo;
	private int total_Approval;
	private int curr_Approval;
	private String ename;
	private String title;
	private Date writedate;
	private int statusCode;
}
