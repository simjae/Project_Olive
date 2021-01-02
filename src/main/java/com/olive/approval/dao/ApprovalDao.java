package com.olive.approval.dao;

import java.util.List;

import com.olive.dto.Doc_Type;
import com.olive.dto.Emp;

public interface ApprovalDao {
	public Emp selectEmp(String empno);
	public List<Doc_Type> selectDocType();
}
