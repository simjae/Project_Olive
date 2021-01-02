package com.olive.approval.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.olive.approval.dao.ApprovalDao;
import com.olive.dto.Approver;
import com.olive.dto.Dept;
import com.olive.dto.Doc_Type;
import com.olive.dto.Document;
import com.olive.dto.Emp;
import com.olive.dto.Head;

@Service
public class ApprovalService {

	   private SqlSession sqlsession;

	   @Autowired
	   public void setSqlsession(SqlSession sqlsession) {
	      this.sqlsession = sqlsession;
	      System.out.println(this.sqlsession);
	   }
	   
	   public Emp selectEmp(String empno) {
		   ApprovalDao approvalDao = sqlsession.getMapper(ApprovalDao.class);
		   return approvalDao.selectEmp(empno);
	   }
	   public List<Doc_Type> selectDocType() {
		   ApprovalDao approvalDao = sqlsession.getMapper(ApprovalDao.class);
		   return approvalDao.selectDocType();
	   }
	   
	   public void writeDoc(Document doc,HttpServletRequest request) {
		   ApprovalDao approvalDao = sqlsession.getMapper(ApprovalDao.class);
		   
		   approvalDao.writeDocument(doc);
	   }
	   public List<Emp> getAllEmpList() { 
		   ApprovalDao approvalDao = sqlsession.getMapper(ApprovalDao.class);
		   return approvalDao.getAllEmpList();
	   }
	   public List<Dept> getAllDeptList() {
		   ApprovalDao approvalDao = sqlsession.getMapper(ApprovalDao.class);
		   return approvalDao.getAllDeptList();
	   }
	   
	   public List<Head> getAllHeadList() {
		   ApprovalDao approvalDao = sqlsession.getMapper(ApprovalDao.class);
		   return approvalDao.getAllHeadList();
	   } 
	     
}
