package com.olive.hr_info.dao;

import java.util.List;
import java.util.Map;

import com.olive.dto.Emp;

public interface Hr_infoDao {
	public List<Emp> showEmpList();
	public List<Emp> searchEmp(Map<String, Object> map);
}
