package com.olive.hr_info.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.olive.dto.DeptTest;
import com.olive.dto.Emp;
import com.olive.dto.EmpTest;
import com.olive.hr_info.service.Hr_infoService;




@RestController
@RequestMapping("/HRinfo/")
public class HRAjaxController {
	
	@Autowired
	private Hr_infoService empService;

	
	//사원 조건 조회
	@RequestMapping(value="searchByEmpno.do")
	public List<EmpTest> searchEmp(String param1, String param2){
		System.out.println(param1);
		System.out.println(param2);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("param1", param1);
		map.put("param2", param2);
		System.out.println(map);
		List<EmpTest> list = empService.searchEmp(map);
		return list;
	}
	
	//조직도 부서별 조회
	@RequestMapping(value="showOrgbyDept.do")
	public List<DeptTest> showOrgbyDept(String param){
		List<DeptTest> emplist = empService.showOrgbyDept(param);
		return emplist;
	}

	//마이페이지 수정하기
	@RequestMapping(value="updateMyInfo.do")
	public Emp updateMyInfo(String param1, String param2, String param3, String param4, String param5) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("param1", param1); //empno
		map.put("param2", param2); //pwd
		map.put("param3", param3); //email
		map.put("param4", param4); //phone
		map.put("param5", param5); //address
		System.out.println("여기는 왔어");
		Emp emp = empService.updateMyInfo(map);
		System.out.println(emp);
		return emp;
	}
	
	
	
}
