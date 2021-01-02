package com.olive.hr_management.dao;

import java.util.List;

import com.olive.dto.Emp;

public interface Hr_managementDao {
	public void insertNewEmp(Emp emp);
	public List<Emp> selectAllList();
}
