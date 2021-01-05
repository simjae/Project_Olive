/*
	파일명: HrManageMentController.java
    설명: 인사관리 Controller 
    작성일: 2021-01-02
    작성자: 백희승
*/
package com.olive.hr_management.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.olive.dto.Dept;
import com.olive.dto.Emp;
import com.olive.dto.Head;
import com.olive.dto.Position;
import com.olive.hr_management.service.Hr_managementService;

@Controller
@RequestMapping("/HR_management/")
public class Hr_ManagementController {

	@Autowired
	private Hr_managementService service;

	// 암호화 객체
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	// 인사관리 > 계정 관리
	@RequestMapping(value = "EmployeeAccount.do", method = RequestMethod.GET)
	public String employeeAccount(Model model) {
		System.out.println("management 컨트롤러 진입");
		List<Emp> empList = service.getEmpList();
		System.out.println("Controller result: " + empList);
		model.addAttribute("empList", empList);

		return "HR_management/EmployeeAccount";
	}

	// 인사관리 > 조직 관리
	@RequestMapping("Organization.do")
	public String organization() {
		return "HR_management/Organization";
	}

	// 인사관리 > 계정 관리 > 사원 신규 등록
	@RequestMapping(value = "EmployeeAccount.do", method = RequestMethod.POST)
	public String insertNewAccount(Emp emp) {

		// 확인
		System.out.println("==================================비밀번호 확인!! : 사번 - " + emp.getEmpNo() + "/ 비밀번호 - " + emp.getPwd());
		
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
