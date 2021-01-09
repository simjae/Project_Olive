package com.olive.approval.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.olive.approval.service.ApprovalService;
import com.olive.approval.utils.ApprovalCriteria;
import com.olive.dto.Approver;
import com.olive.dto.Dept;
import com.olive.dto.Emp;
import com.olive.dto.Head;

import paging.Pagination;
import paging.PagingService;

@RestController
@RequestMapping("/approval/")
public class ApprovalRestController {

	@Autowired
	private PagingService paging;
	
	private ApprovalService approvalService;

	@Autowired
	public void setApprovalService(ApprovalService approvalService) {
		this.approvalService = approvalService;
	}

	@RequestMapping(value = "/getAllEmpList.do")
	private List<Emp> getAllEmpList() {
		
		return approvalService.getAllEmpList();
	}
	@RequestMapping(value = "/getAllDeptList.do")
	private List<Dept> getAllDeptList() {
		
		return approvalService.getAllDeptList();
	}

	@RequestMapping(value = "/getAllHeadList.do")
	private List<Head> getAllHeadList() {
		
		return approvalService.getAllHeadList();
	}
	
	@RequestMapping(value="/getArrangedDocList.do")
	private Map<String,Object> getArrangedDocList(String statusCode,String size,Principal principal,ApprovalCriteria cri) {
		cri.setCriteria("getDoc", "docno", "desc");
		cri.setSearchType("empno");
		cri.setKeyword(principal.getName());
		cri.setSearchType2("statusCode");
		cri.setKeyword2(statusCode);
		
		int totalCount =approvalService.getListCount(cri);
		System.out.println(totalCount);
		Pagination pagenation = new Pagination(cri,totalCount);
		System.out.println(cri);
		System.out.println(pagenation);
		List<Map<String,Object>> pagingList = approvalService.getList(cri);
		
		Map<String,Object>  list = new HashMap<String,Object>();
		list.put("criteria", cri);
		list.put("pagination",pagenation);
		list.put("pagingList", pagingList);
		
		return list;
	}
	
	@RequestMapping(value="/getArrangedDocListAjax.do")
	private JSONObject getArrangedDocList(ApprovalCriteria cri) {
		cri.setCriteria("getDoc", "docno", "desc");
		
		int totalCount =approvalService.getListCount(cri);
		System.out.println(totalCount);
		Pagination pagenation = new Pagination(cri,totalCount);
		System.out.println(cri);
		System.out.println(pagenation);
		List<Map<String,Object>> pagingList = approvalService.getList(cri);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("pagingList", pagingList);
		jsonObject.put("pagination", pagenation);
		jsonObject.put("criteria", cri);
		
		return jsonObject;
	}
	
	@RequestMapping(value="/getArrangedAppList.do")
	private Map<String,Object> getArrangedAppList(String statusCode,Principal principal, ApprovalCriteria cri) {
		cri.setCriteria("getApproverDoc", "docno", "desc");
		cri.setSearchType("empno");
		cri.setKeyword(principal.getName());
		cri.setSearchType2("statusCode");
		cri.setKeyword2(statusCode);
		System.out.println("getArrangedAppList");
		
		int totalCount =approvalService.getAppListCount(cri);
		System.out.println(totalCount);
		Pagination pagination = new Pagination(cri,totalCount);
		System.out.println(cri);
		System.out.println(pagination);
		List<Map<String,Object>> pagingList = approvalService.getAppList(cri);
		
		Map<String,Object>  list = new HashMap<String,Object>();
		list.put("criteria", cri);
		list.put("pagination",pagination);
		list.put("pagingList", pagingList);
		
		return list;
	}
	@RequestMapping(value="/getArrangedAppListAjax.do", method = RequestMethod.POST)
	private JSONObject getArrangedAppList(ApprovalCriteria cri) {
		cri.setCriteria("getApproverDoc", "docno", "desc");
		System.out.println("getArrangedAppListAjax");
		
		int totalCount =approvalService.getAppListCount(cri);
		System.out.println(totalCount);
		Pagination pagenation = new Pagination(cri,totalCount);
		System.out.println(cri);
		System.out.println(pagenation);
		List<Map<String,Object>> pagingList= approvalService.getAppList(cri);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("pagingList", pagingList);
		jsonObject.put("pagination", pagenation);
		jsonObject.put("criteria", cri);
		
		return jsonObject;
	}
	
	
	@RequestMapping(value="/approve.do", method=RequestMethod.POST)
	private String approve(@RequestBody Approver app) {
		System.out.println(app); 
		approvalService.approve(app);
		return "/approval/ProgressDoc.do";
	}
	



}
