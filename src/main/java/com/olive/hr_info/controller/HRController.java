package com.olive.hr_info.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.olive.dto.DeptTest;
import com.olive.dto.Emp;
import com.olive.dto.EmpTest;
import com.olive.hr_info.service.Hr_infoService;
import com.olive.utils.Criteria;
import com.olive.utils.Pagination;
import com.olive.utils.service.PagingService;







@Controller
@RequestMapping("/HRinfo/")
public class HRController {
	
	private Hr_infoService empService;
	
	@Autowired
	public void setEmpService(Hr_infoService empService) {
		this.empService = empService;
	}
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private PagingService pagingService;
	
	@RequestMapping("Salary.do")
	public String showSalary() {	
		return "HRinfo/Salary";
	}
	
	@RequestMapping("SalaryDetail.do")
	public String showSalaryDetail() {	
		return "HRinfo/salaryDetail";
	}

	//전체 사원 목록 조회
	@RequestMapping(value="Emp.do", method=RequestMethod.GET)
	public String showEmpList(Model model, Criteria cri) {
		System.out.println("cri 받아오기");
		//empinfo 뷰 사용
		cri.setCriteria("empinfo", "empno", "asc");
		System.out.println("cri 값 초기화 후"+cri);
		
		int totalCount = pagingService.getListCount(cri); //이거 게시물개수 뽑으려고 쓰는거야 왜 cri쓰는지는 아직 의문
		System.out.println(totalCount);
	    Pagination pagination = new Pagination(cri, totalCount);
	      
	    cri.setPerPageNum(3);
	    
	    ///////////////
	    List<Map<String, Object>> result = pagingService.getList(cri);

	    System.out.println(result);
	    System.out.println(pagination);
	    System.out.println(cri);
	    
	    model.addAttribute("emplist", result);
	    model.addAttribute("pagination", pagination);
	    model.addAttribute("criteria", cri);
	      
		//List<EmpTest> emplist = empService.showEmpList();
		//model.addAttribute("emplist", emplist);
		return "HRinfo/Emp";
	}
	
	//조직도 본부 단위 (default) //미완성
	@RequestMapping(value="Organization_chart.do", method=RequestMethod.GET)
	public String showOrg(Model model) {
		List<DeptTest> headlist = empService.showOrg();
		model.addAttribute("head", headlist);
		return "HRinfo/Organization_chart";
	}
	
	//마이페이지 처음 보여줄 때
	@RequestMapping(value="EditMyinfo.do", method=RequestMethod.GET)
	public String editMyinfo(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username = auth.getName();
		System.out.println(username);
		Map<String, Object> emp = empService.searchEmpByEmpno(username);
		System.out.println(emp);
		model.addAttribute("emp", emp);
		return "HRinfo/EditMyinfo";
		
	}
	
	//마이페이지 수정하기
	@RequestMapping(value="updateMyInfo.do", method=RequestMethod.POST)
	public String updateMyInfo(Emp emp, HttpServletRequest request) {
		System.out.println("수정할고야");
		System.out.println(emp);
		emp.setPwd(this.bCryptPasswordEncoder.encode(emp.getPwd()));
		
		empService.updateMyInfo(emp, request);
		return "redirect:/HRinfo/EditMyinfo.do";
			
	}
	
	
	
}
