package com.olive.hr_management.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.olive.dto.Emp;
import com.olive.hr_management.dao.Hr_managementDao;

@Service
public class Hr_managementService {
	
	private SqlSession sqlsession;

	   @Autowired
	   public void setSqlsession(SqlSession sqlsession) {
	      this.sqlsession = sqlsession;
	      System.out.println(this.sqlsession);
	   }
	
	public List<Emp> getEmpList(){
		System.out.println("getEmpList 서비스 진입");
		List<Emp> result = null;
		Hr_managementDao hr_managementDao = sqlsession.getMapper(Hr_managementDao.class);
		try {
			result = hr_managementDao.getEmpList();
			System.out.println("getEmpList result : "+result);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getEmpList error : "+e.getMessage());
		}
		
		return result;
	}
}
