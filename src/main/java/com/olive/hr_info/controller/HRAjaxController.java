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

import com.olive.dto.Emp;
import com.olive.hr_info.service.Hr_infoService;




@RestController
@RequestMapping("/HRinfo/")
public class HRAjaxController {
	
	@Autowired
	private Hr_infoService empService;

	
	//ajax 사번으로 검색
	@RequestMapping(value="searchByEmpno.do")
	public List<Emp> searchEmp(String param1, String param2){
		System.out.println(param1);
		System.out.println(param2);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("param1", param1);
		map.put("param2", param2);
		System.out.println(map);
		List<Emp> list = empService.searchEmp(map);
		return list;
	}
	

	
	
	
}
