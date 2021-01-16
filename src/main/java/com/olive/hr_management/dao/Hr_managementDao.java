/*
	파일명: Hr_managementDao.java
    설명: 인사관리 Dao
    작성일: 2021-01-02
    작성자: 백희승
*/
package com.olive.hr_management.dao;

import java.util.List;
import java.util.Map;

import com.olive.dto.Class;
import com.olive.dto.Dept;
import com.olive.dto.Emp;
import com.olive.dto.Head;
import com.olive.dto.Position;
import com.olive.dto.Sal_Record;
import com.olive.dto.SalaryInfo;
import com.olive.utils.Criteria;

public interface Hr_managementDao {
	
//	public List<Emp> getEmpList() throws Exception;

//	public List<Map<String, Object>> getEmpList(Criteria cri);
	
//	public int getListCount() throws Exception;

	public void insertNewEmp(Emp emp);

	public List<Emp> selectAllList();

	public Emp checkEmpNo(String empNo);
	
	public List<Head> getHeadQuarters();
	
	public List<Dept> getDepartments(String headCode);
	
	public List<Position> getPositions();
	
	public List<Class> getClasses();

	public SalaryInfo getSalaryDetail(Map parameter);
	
	public void insertSalaryTbl(List<Sal_Record> excelData); 
	
	public List<Map<String, Object>> getAnnualList(String empno);
	
	public void updateAnnual(Map<String, Object> map);
	
	public void updateAttRecord(Map<String, Object> map);

	public String checkEmpno(String empno); 
}
