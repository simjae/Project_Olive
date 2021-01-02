package com.olive.hr_management.dao;

import java.util.List;

import com.olive.dto.Dept;
import com.olive.dto.Emp;
import com.olive.dto.Head;

public interface Hr_managementDao {
	public void insertNewEmp(Emp emp);

	public List<Emp> selectAllList();

	public Emp checkEmpNo(String empNo);
	
	public List<Head> getHeadQuarters();
	
	public List<Dept> getDepartments(String headCode);
}
