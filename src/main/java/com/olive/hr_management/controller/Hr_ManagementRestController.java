package com.olive.hr_management.controller;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.olive.hr_management.service.Hr_managementService;
import com.olive.utils.Criteria;
import com.olive.utils.Pagination;
import com.olive.utils.service.PagingService;

@RestController
@RequestMapping("/HR_managementRest/")
public class Hr_ManagementRestController {

	@Autowired
	private PagingService pagingService;
	
	@Autowired
	private Hr_managementService managementService;
	
	@RequestMapping(value = "getList.do", method = RequestMethod.POST)
	public JSONObject getEmpListBykeyword(Criteria cri) {
		cri.setCriteria("empinfo", "empno", "desc");
		int totalCount = pagingService.getListCount(cri);
		cri.setPerPageNum(5);
		Pagination pagination = new Pagination(cri, totalCount);
		List<Map<String, Object>> result = pagingService.getList(cri);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("list", result);
		jsonObject.put("pagination", pagination);
		jsonObject.put("criteria", cri);
		System.out.println(result);
		System.out.println(pagination);
		System.out.println(cri);
		
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
	
	@RequestMapping(value = "createEmpno.do", method = RequestMethod.POST)
	public String createEmpno(String empno) {
		String result = managementService.createEmpno(empno);
		return result;		
	}

	//근태관리 
	@RequestMapping(value = "getAttList.do", method = RequestMethod.POST)
	public JSONObject getEmpAttListBykeyword(Criteria cri) {
		
		cri.setCriteria("emp_att", "starttime", "desc");
		int totalCount = pagingService.getListCount(cri);
		Pagination pagination = new Pagination(cri, totalCount);
		List<Map<String, Object>> result = pagingService.getList(cri);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("list", result);
		jsonObject.put("pagination", pagination);
		jsonObject.put("criteria", cri);
		
		return jsonObject;		
	}
	
	//휴가관리 
	@RequestMapping(value = "getAnnList.do", method = RequestMethod.POST)
	public JSONObject getEmpAnnListBykeyword(Criteria cri) {
		
		cri.setCriteria("annual_diff", "startdate", "desc");
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
