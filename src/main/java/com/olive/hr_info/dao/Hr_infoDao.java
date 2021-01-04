package com.olive.hr_info.dao;

import java.util.List;

import com.olive.dto.Emp;

public interface Hr_infoDao {
	public List<Emp> showEmpList();
	public List<Emp> searchByEmpno(String empno);
	public List<Emp> searchByEname(String ename);
	public List<Emp> searchByDept(String deptname);
}
