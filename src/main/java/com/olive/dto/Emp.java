/*
	파일명: Emp.java
    설명: 사원(Emp) DTO 객체
    작성일: 
    작성자: 
*/
package com.olive.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Emp {
	private int empNo;
	private String pwd;
	private String ename;
	private String email;
	private String pic;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date hireDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date leaveDate;
	private int annaul;
	private int classCode;
	private int positionCode;
	private int deptCode;
	private int statusCode;
	private boolean enabled;
	private int loginCount;
	private int alarm;
	private String birth;
	private String phone;
	private String address;
	
}
