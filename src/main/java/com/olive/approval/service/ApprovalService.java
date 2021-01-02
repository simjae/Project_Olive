package com.olive.approval.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.olive.approval.dao.ApprovalDao;
import com.olive.dto.Doc_Type;
import com.olive.dto.Emp;

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
}
