package com.olive.dto;

import java.text.DecimalFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class SalaryInfo{
	
	private String ename;
	private String deptname;
	private String headname;
	private String positionname;
	private String classname;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date hiredate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date sal_date;
	private String empno;
	
	private String basic_pay;
	private String overtime_pay;
	private String position_pay;
	private String bonus;
	private String maintenance_of_vehicle;
	private String educational_supports;
	private String mess_allowance;
	
	private String income_tax;				//소득세 평균 소득 세율(21%) 가정 
	private String local_income_tax;		//지방소득세 10%
	private String employment_insurance;	//고용보험	0.8%
	private String health_insurance;		//건강보험 3.43%
	private String care_insurance;			//요양보험 11.52%
	private String national_pension;		//국민연금 4.5%
	
	
	
	private String totalIncome;
	private String exemption;
	
	DecimalFormat format = new DecimalFormat("#,###.0");
	
	public void conversionFormality () {
		this.basic_pay = format.format(this.basic_pay);
		this.overtime_pay = format.format(this.overtime_pay);
		this.position_pay = format.format(this.position_pay);
		this.bonus = format.format(this.bonus);
		this.maintenance_of_vehicle = format.format(this.maintenance_of_vehicle);
		this.educational_supports = format.format(this.educational_supports);
		this.mess_allowance = format.format(this.mess_allowance);
		
		this.income_tax = format.format(this.income_tax);
		this.local_income_tax = format.format(this.local_income_tax);
		this.employment_insurance = format.format(this.employment_insurance);
		this.health_insurance = format.format(this.health_insurance);
		this.care_insurance = format.format(this.care_insurance);
		this.national_pension = format.format(this.national_pension);

//		this.totalIncome = format.format(this.totalIncome);
//		this.exemption = format.format(this.exemption);
	}
	
//	private void calcTotal() {
//		this.totalIncome = getBasic_pay()+getOvertime_pay()+getPosition_pay()
//							+getBonus()+getMaintenance_of_vehicle()+getMess_allowance();
//		
//		this.exemption = getIncome_tax()+ getLocal_income_tax()+getEmployment_insurance()
//							+getHealth_insurance()+getCare_insurance()+getNational_pension();
//	}
}
