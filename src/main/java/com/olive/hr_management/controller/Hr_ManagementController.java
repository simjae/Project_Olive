/*

    파일명: HrManageMentController.java
    설명: 인사관리 Controller 
    작성일: 2021-01-02
    작성자: 백희승
*/
package com.olive.hr_management.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.olive.dto.Emp;
import com.olive.dto.SalaryInfo;
import com.olive.hr_management.service.Hr_managementService;
import com.olive.utils.Criteria;
import com.olive.utils.Pagination;
import com.olive.utils.service.PagingService;

@Controller
@RequestMapping("/HR_management/")
public class Hr_ManagementController {

	@Autowired
	private Hr_managementService managementService;

	@Autowired
	private PagingService pagingService;

	// 암호화 객체
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	

	
	//인사관리 > 급여관리 페이지
	@RequestMapping(value = "Salary.do", method = RequestMethod.GET)
	public String salaryPage(Model model, Criteria cri) {
		cri.setCriteria("salaryinfo", "SAL_DATE", "DESC");

		int totalCount = pagingService.getListCount(cri);
		cri.setPerPageNum(5);
		Pagination pagination = new Pagination(cri, totalCount);

		List<Map<String, Object>> result = pagingService.getList(cri);

		model.addAttribute("list", result);
		model.addAttribute("pagination", pagination);
		model.addAttribute("criteria", cri);
		return "HR_management/Salary";
	}
	
	//인사관리 > 급여관리 > 급여상세
	@RequestMapping(value = "SalaryDetail.do", method = RequestMethod.GET)
	public String getSalaryDetail(Model model, String date, int empno) {
		SalaryInfo salaryInfo = managementService.getSalaryDetail(date, empno);
		salaryInfo.conversionFormality();
		model.addAttribute("salaryInfo", salaryInfo);
		return "HRinfo/salaryDetail";
	}

	// 인사관리 > 계정 관리 > 엑셀 다운로드
	@RequestMapping(value = "SalaryExcelForm.do")
	public String salaryExcelForm(Model model, Criteria cri) {
		System.out.println("들어옴");
		return "salaryExcelFormat";
	}

	// 인사관리 > 계정 관리 > 엑셀 다운로드
	@RequestMapping(value = "EmpTableToExcel.do")
	public String downloadExcel(Model model, Criteria cri) {
		cri.setCriteria("empinfo", "empno", "asc");
		cri.setPerPageNum(99);
		List<Map<String, Object>> list = pagingService.getList(cri);
		model.addAttribute("list", list);
		return "empTableToExcel";
	}

	// 인사관리 > 조직관리 페이지
	@RequestMapping("Organization.do")
	public String organization(Model model) {
		Map<String, String> result= managementService.getOrganizationInfo();
		model.addAttribute("dashboard", result);
		return "HR_management/Organization";
	}

	// 인사관리 > 계정 관리 페이지
	@RequestMapping(value = "EmployeeAccount.do", method = RequestMethod.GET)
	public String employeeAccount(Model model, Criteria cri) {
		cri.setCriteria("empinfo", "empno", "desc");

		int totalCount = pagingService.getListCount(cri);
		Pagination pagination = new Pagination(cri, totalCount);
		cri.setPerPageNum(5);
		List<Map<String, Object>> result = pagingService.getList(cri);
		System.out.println("[result] : " + result);

		model.addAttribute("list", result);
		model.addAttribute("pagination", pagination);
		model.addAttribute("criteria", cri);

		return "HR_management/EmployeeAccount";
	}
	
	//인사관리 > 계정관리 > 사원등록 페이지
	@RequestMapping(value = "registration.do", method = RequestMethod.GET)
	public String registeration() {
		return "HR_management/employeeRegistration";
	}

	// 인사관리 > 계정관리 > 사원 등록
	@RequestMapping(value = "EmployeeAccount.do", method = RequestMethod.POST)
	public String insertNewAccount(Emp emp) {
		emp.setPwd(this.bCryptPasswordEncoder.encode(emp.getPwd()));
		managementService.insertNewEmp(emp);
		return "redirect:/HR_management/EmployeeAccount.do";
	}

	// 인사관리 >> 근태관리 / 휴가관리
	@RequestMapping(value = "EmployeeAttendance.do", method = RequestMethod.GET)
	public String employeeAttendance(Model model, Criteria cri1, Criteria cri2) {

		cri1 = new Criteria();
		cri2 = new Criteria();
		// 근태 테이블
		cri1.setCriteria("emp_att", "starttime", "desc");
		// 휴가 테이블
		cri2.setCriteria("annual_diff", "startdate", "desc");
		int totalCount1 = pagingService.getListCount(cri1);
		int totalCount2 = pagingService.getListCount(cri2);
		Pagination pagination1 = new Pagination(cri1, totalCount1);
		Pagination pagination2 = new Pagination(cri2, totalCount2);

		List<Map<String, Object>> result1 = pagingService.getList(cri1);
		List<Map<String, Object>> result2 = pagingService.getList(cri2);
		System.out.println("result1입니다.");
		System.out.println("[result1] : " + result1);
		System.out.println("result2입니다.");
		System.out.println("[result2] : " + result2);
		model.addAttribute("attendance", result1);
		model.addAttribute("annual", result2);
		model.addAttribute("pagination1", pagination1);
		model.addAttribute("pagination2", pagination2);
		model.addAttribute("criteria1", cri1);
		model.addAttribute("criteria2", cri2);
		System.out.println("휴가/근태관리");
		return "HR_management/EmployeeAttendance";
	}
}
