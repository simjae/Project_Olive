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
		System.out.println(cri);
		int totalCount = pagingService.getListCount(cri);
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
		
		cri.setCriteria("empAnnual", "empno", "asc");
		int totalCount = pagingService.getListCount(cri);
		Pagination pagination = new Pagination(cri, totalCount);
		List<Map<String, Object>> result = pagingService.getList(cri);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("list", result);
		jsonObject.put("pagination", pagination);
		jsonObject.put("criteria", cri);
		
		return jsonObject;		
	}
	
	//휴가관리 연차이력 조회
	@RequestMapping(value="getAnnualList.do", method = RequestMethod.POST)
	public List<Map<String, Object>> getAnnualList(String empno){
		System.out.println(empno);
		List<Map<String, Object>> annualList = managementService.getAnnualList(empno);
		System.out.println("얘 뽑은거임"+annualList);
		return annualList;
	}
	
	//휴가관리 수정하기
	@RequestMapping(value="updateAnnual.do", method=RequestMethod.POST)
	public String updateAnnual(String empno, String annual) {
		System.out.println("editAnnual");
		System.out.println(empno);
		System.out.println(annual);
		
		managementService.updateAnnual(empno, annual);
		System.out.println("????");
		//return "redirect:/HRinfo/EditMyinfo.do";
		return null;	
	}
}
