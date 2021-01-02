package com.olive.hr_management.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.olive.dto.Dept;
import com.olive.dto.Emp;
import com.olive.dto.Head;
import com.olive.hr_management.service.Hr_managementService;

@Controller
@RequestMapping("/HR_management")
public class HrManageMentController {

	@Autowired
	private Hr_managementService service;

	// 인사관리 > 계정 관리
	@RequestMapping(value = "EmployeeAccount.do", method = RequestMethod.GET)
	public String employeeAccount() {
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
		System.out.println(emp);
		service.insertNewEmp(emp);
		// List<Emp> list = null;
		// list = service.selectAllList();
		// System.out.println("출력" + list);
		return "HR_management/EmployeeAccount";
	}

	// 사원 신규 등록 시 사번 중복 검증
	@RequestMapping(value = "checkEmpNo.do", method = RequestMethod.POST)
	@ResponseBody
	public Emp checkEmpNo(String empNo) {
		Emp dto = service.checkEmpNo(empNo);
		System.out.println(dto);
		return dto;
	}

	@RequestMapping(value="getHead.do", method=RequestMethod.POST)
	@ResponseBody
	public List<Head> getHeadQuarters(){
		List<Head> HQList = service.getHeadQuarters();
		System.out.println(HQList);
		return HQList;
	}

	@RequestMapping(value="getDept.do", method=RequestMethod.POST)
	@ResponseBody
	public List<Dept> getDepartments(String headCode) {
		System.out.println("선택한 본부 값 컨트롤러 : " + headCode);
		List<Dept> deptList = service.getDepartments(headCode);
		System.out.println("검색된 department : " + deptList);
		return deptList;
	}
	
}
