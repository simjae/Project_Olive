package com.olive.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Sal_Record {
	private Date salDate;
	private int empNo;
	private int basicSal;
	private double income_Tax;
	private double resident_Tax;
	private double employment_Insucance_Premium;
	private double national_Pension;
	private double long_term_Premium;
}
