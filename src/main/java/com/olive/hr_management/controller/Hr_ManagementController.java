/*

    파일명: HrManageMentController.java
    설명: 인사관리 Controller 
    작성일: 2021-01-02
    작성자: 백희승
*/
package com.olive.hr_management.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.olive.dto.Dept;
import com.olive.dto.Emp;
import com.olive.dto.Head;
import com.olive.dto.Position;
import com.olive.dto.SalaryInfo;
import com.olive.hr_management.service.Hr_managementService;

import paging.Criteria;
import paging.Pagination;
import paging.PagingService;

@Controller
@RequestMapping("/HR_management/")
public class Hr_ManagementController {


	@Autowired
	private Hr_managementService service;

	@Autowired
	private PagingService pagingService;

	// 암호화 객체
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@RequestMapping(value = "Salary.do", method = RequestMethod.GET)
	public String salaryPage(Model model, Criteria cri) {
		cri.setCriteria("salaryinfo", "SAL_DATE", "DESC");

		int totalCount = pagingService.getListCount(cri);
		Pagination pagination = new Pagination(cri, totalCount);

		List<Map<String, Object>> result = pagingService.getList(cri);

		model.addAttribute("list", result);
		model.addAttribute("pagination", pagination);
		model.addAttribute("criteria", cri);

		return "HR_management/Salary";		
	}
	
	@RequestMapping(value ="SalaryDetail.do", method = RequestMethod.GET)
	public String getSalaryDetail(Model model, String date, int empno) {
		SalaryInfo salaryInfo = service.getSalaryDetail(date, empno);
//		salaryInfo.conversionFormality();
//		System.out.println(salaryInfo);
		model.addAttribute("salaryInfo", salaryInfo);
		return "HRinfo/salaryDetail";
	}
	
	// 인사관리 > 조직 관리 페이지
	@RequestMapping("Organization.do")
	public String organization() {
		return "HR_management/Organization";
	}

	// 인사관리 > 계정 관리 페이지
	@RequestMapping(value = "EmployeeAccount.do", method = RequestMethod.GET)
	public String employeeAccount(Model model, Criteria cri) {
		System.out.println("cri 값 초기화 전" + cri);
		cri.setCriteria("empinfo", "empno", "desc");
		System.out.println("cri 값 초기화 후" + cri);

		int totalCount = pagingService.getListCount(cri);
		Pagination pagination = new Pagination(cri, totalCount);

		List<Map<String, Object>> result = pagingService.getList(cri);
		System.out.println("[result] : " + result);

		model.addAttribute("list", result);
		model.addAttribute("pagination", pagination);
		model.addAttribute("criteria", cri);

		return "HR_management/EmployeeAccount";
	}

	// 인사관리 > 계정 관리 > 엑셀 다운로드
	@RequestMapping(value = "EmpTableToExcel.do")
	public String downloadExcel(Model model, Criteria cri) {
		cri.setCriteria("empinfo", "empno", "asc");
		cri.setPerPageNum(99);
		List<Map<String, Object>> list = pagingService.getList(cri);
		model.addAttribute("list", list);
		System.out.println("엑셀다운로드");
		System.out.println(list);
		return "empTableToExcel";
	}


	// 인사관리 > 계정 관리 > 사원 신규 등록
	@RequestMapping(value = "EmployeeAccount.do")
	public String insertNewAccount(Emp emp) {

		// 확인
		System.out.println(
				"==================================비밀번호 확인!! : 사번 - " + emp.getEmpNo() + "/ 비밀번호 - " + emp.getPwd());

		// 비밀번호 암호화하여 INSERT
		emp.setPwd(this.bCryptPasswordEncoder.encode(emp.getPwd()));

		// 암호화 확인
		System.out.println("==================================비밀번호 암호화 확인 : " + emp.getPwd());

		service.insertNewEmp(emp);
		return "HR_management/EmployeeAccount";
	}

	// 인사관리 > 계정 관리 > 사원 신규 등록 시 사번 중복 검증
	@RequestMapping(value = "checkEmpNo.do", method = RequestMethod.POST)
	@ResponseBody
	public Emp checkEmpNo(String empNo) {
		Emp dto = service.checkEmpNo(empNo);
		return dto;
	}

	// 인사관리 > 계정 관리 > 사원 신규 등록 시 AJAx 본부 테이블 가져오기
	@RequestMapping(value = "getHead.do", method = RequestMethod.POST)
	@ResponseBody
	public List<Head> getHeadQuarters() {
		List<Head> HQList = service.getHeadQuarters();
		return HQList;
	}

	// 인사관리 > 계정 관리 > 사원 신규 등록 > 본부 선택 시 해당 본부의 부서 AJAx 가져오기
	@RequestMapping(value = "getDept.do", method = RequestMethod.POST)
	@ResponseBody
	public List<Dept> getDepartments(String headCode) {
		List<Dept> deptList = service.getDepartments(headCode);
		return deptList;
	}

	// 인사관리 > 계정 관리 > 사원 신규 등록 > 직책(Position) 테이블 가져오기
	@RequestMapping(value = "getPosition.do", method = RequestMethod.POST)
	@ResponseBody
	public List<Position> getPositions() {
		List<Position> positionList = service.getPositions();
		return positionList;
	}

	// 인사관리 > 계정 관리 > 사원 신규 등록 > 직위(Class) 테이블 가져오기
	@RequestMapping(value = "getClass.do", method = RequestMethod.POST)
	@ResponseBody
	public List<com.olive.dto.Class> getClasses() {
		List<com.olive.dto.Class> classList = service.getClasses();
		return classList;
	}



}
