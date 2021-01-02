package com.olive.approval.dao;

import java.util.List;

import com.olive.dto.Dept;
import com.olive.dto.Doc_Type;
import com.olive.dto.Document;
import com.olive.dto.Emp;
import com.olive.dto.Head;

public interface ApprovalDao {
	public Emp selectEmp(String empno);
	public List<Doc_Type> selectDocType();
	public void writeDocument(Document doc);
	public List<Emp> getAllEmpList();
	public List<Dept> getAllDeptList();
	public List<Head> getAllHeadList();

	
}
