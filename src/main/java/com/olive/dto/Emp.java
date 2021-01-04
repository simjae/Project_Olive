package com.olive.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Emp {
	private int empNo;
	private String pwd;
	private String ename;
	private String email;
	private String pic;
	private Date hireDate;
	private Date leaveDate;
	private int annaul;
	private int classCode;
	private int positionCode;
	private int deptCode;
	private int statusCode;
	private boolean enabled;
	private int loginCount;
	private int alram;
}
