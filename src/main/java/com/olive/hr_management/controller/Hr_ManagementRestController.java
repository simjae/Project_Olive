package com.olive.hr_management.controller;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.olive.dto.Emp;

import paging.Criteria;
import paging.Pagination;
import paging.PagingService;

@RestController
@RequestMapping("/HR_managementRest/")
public class Hr_ManagementRestController {

	@Autowired
	private PagingService pagingService;
	
	@RequestMapping(value = "getList.do", method = RequestMethod.POST)
	public JSONObject getEmpListBykeyword(Criteria cri) {
		System.out.println(cri);
		cri.setCriteria("empinfo", "empno", "desc");
		System.out.println(cri);
		int totalCount = pagingService.getListCount(cri);
		Pagination pagination = new Pagination(cri, totalCount);
		List<Map<String, Object>> result = pagingService.getList(cri);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("list", result);
		jsonObject.put("pagination", pagination);
		jsonObject.put("criteria", cri);
		
		return jsonObject;		
	}
	
	@RequestMapping(value = "Salary.do", method = RequestMethod.POST)
	public JSONObject getSalaryList(Criteria cri) {
		cri.setCriteria("salaryinfo", "SAL_DATE", "DESC");
		cri.setPerPageNum(5);
		int totalCount = pagingService.getListCount(cri);
		Pagination pagination = new Pagination(cri, totalCount);
		List<Map<String, Object>> result = pagingService.getList(cri);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("list", result);
		jsonObject.put("pagination", pagination);
		jsonObject.put("criteria", cri);
		
		return jsonObject;		
	}

}
