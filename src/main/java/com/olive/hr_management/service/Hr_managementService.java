package com.olive.hr_management.service;

import java.util.ArrayList;
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
	   
	   // 인사관리 : 사원 신규 등록
	   public void insertNewEmp(Emp emp) {
		   Hr_managementDao dao = sqlsession.getMapper(Hr_managementDao.class);
		   dao.insertNewEmp(emp);
		   System.out.println("서비스단 거침스");
	   }
	   
	   public List<Emp> selectAllList(){
		   List<Emp> list = new ArrayList<Emp>();
		   Hr_managementDao dao = sqlsession.getMapper(Hr_managementDao.class);
		   list = dao.selectAllList();
		   return list;
	   }
}
