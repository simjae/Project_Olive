package com.olive.hr_info.dao;

import java.util.List;
import java.util.Map;

import com.olive.dto.DeptTest;
import com.olive.dto.Emp;
import com.olive.dto.EmpTest;

public interface Hr_infoDao {
	public List<Emp> showEmpList();
	public List<Emp> searchEmp(Map<String, Object> map);
	public List<DeptTest> showOrg();
	public List<DeptTest> showOrgbyDept(String param);
}
