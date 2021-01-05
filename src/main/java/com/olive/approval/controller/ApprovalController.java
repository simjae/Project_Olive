package com.olive.approval.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.olive.approval.service.ApprovalService;
import com.olive.dto.Approver;
import com.olive.dto.Doc_Type;
import com.olive.dto.Document;
import com.olive.dto.EmpTest;

@Controller
@RequestMapping("/approval/")
public class ApprovalController {
	private ApprovalService approvalService;
	
	@Autowired
	public void setApprovalService(ApprovalService approvalService) {
		this.approvalService=approvalService;
	}
	
	//전자결재 메인페이지
	@RequestMapping(value = "approvalHome.do", method = RequestMethod.GET)
	public String approvalHome(Model model,Principal principal) {
		String empno = principal.getName();
		System.out.println(empno);
		//전체 내가올린 문서 
		List<Document> document = approvalService.getDocument(empno);
		//전체 내가 결재 해야할 문서
		List<Approver> approver = approvalService.getApprover(empno);
		
		model.addAttribute("arrangedDoc", approvalService.arrangeDoc(document));
		model.addAttribute("arrangedAppDoc", approvalService.arrangedAppDoc(approver));
		
		model.addAttribute("approver", approver);
		model.addAttribute("document", document);
		return "approval/approvalHome";
	}
	
	@RequestMapping(value = "DocWrite.do", method = RequestMethod.GET)
	public String docWrite(Model model, HttpServletRequest request) {
		Date nowTime = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		model.addAttribute("time", sf.format(nowTime));
		String empno = request.getUserPrincipal().getName();
		System.out.println(empno);
		EmpTest emp = approvalService.selectEmp(empno);
		List<Doc_Type> docType = approvalService.selectDocType();
		
		model.addAttribute("docType", docType);
		System.out.println(docType);
		model.addAttribute("emp", emp);
		
		
		return "approval/DocWirte";
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
	
	@RequestMapping(value="DocWrite.do", method=RequestMethod.POST)
	public String docInsert(Document doc,BindingResult result,HttpServletRequest request) {
		try {
			approvalService.writeDoc(doc,request);
			
		}catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println("다 안드감");
			// TODO: handle exception
		}{
			
		}
		return "redirect:/approval/approvalHome.do";
	}
	
	@RequestMapping(value = "PersonalDoc.do", method = RequestMethod.GET)
	public String showPersonalDoc() {
		
		return "approval/PersonalDoc";
	}
	
	@RequestMapping(value = "ProgressDoc.do", method = RequestMethod.GET)
	public String showPregressDoc(Principal p) {
		
		return "approval/ProgressDoc";
	}
}
