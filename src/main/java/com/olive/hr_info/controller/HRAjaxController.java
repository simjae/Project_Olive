package com.olive.hr_info.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.olive.dto.Emp;
import com.olive.hr_info.service.Hr_infoService;




@RestController
@RequestMapping("/HRinfo/")
public class HRAjaxController {
	
	@Autowired
	private Hr_infoService empService;
	
	//ajax 사번으로 검색
	@RequestMapping(value="searchByEmpno.do")
	public List<Emp> selectEmpno(String empno){
		List<Emp> list = empService.searchByEmpno(empno);
		return list;
	}
	
	//ajax 이름으로 검색
	@RequestMapping(value="searchByEname.do")
	public List<Emp> selectEname(String ename){
		System.out.println("ename 들고와ㅉㅑ?");
		List<Emp> list = empService.searchByEname(ename);
		return list;
	}
	
	//ajax 부서로 검색
	@RequestMapping(value="searchByDept.do")
	public List<Emp> selectDept(String deptname){
		List<Emp> list = empService.searchByDept(deptname);
		return list;
	}
	
	
	
	
}
