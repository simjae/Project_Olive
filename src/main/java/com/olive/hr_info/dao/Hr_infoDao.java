package com.olive.hr_info.dao;

import java.util.List;
import java.util.Map;

import com.olive.dto.DeptTest;
import com.olive.dto.Emp;
import com.olive.dto.EmpTest;

public interface Hr_infoDao {
	public List<EmpTest> showEmpList();
	public List<EmpTest> searchEmp(Map<String, Object> map);
	public Emp searchEmpByEmpno(String emono);
	public List<DeptTest> showOrg();
	public List<DeptTest> showOrgbyDept(String param);
	public int updateMyInfo(Emp emp);
}
