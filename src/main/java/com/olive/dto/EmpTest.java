package com.olive.dto;

import java.util.Date;

import lombok.Data;

@Data
public class EmpTest {
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
	private int alarm;
	//private int deptcode;
	private String deptname;
	private int headcode;
	//private int positioncode;
	private String positionname;
	private int positional;
	//private int statuscode;
	private String statusname;
}
