package com.olive.hr_info.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.olive.dto.DeptTest;
import com.olive.dto.Emp;
import com.olive.dto.EmpTest;
import com.olive.hr_info.dao.Hr_infoDao;



@Service
public class Hr_infoService {

	   private SqlSession sqlsession;

	   @Autowired
	   public void setSqlsession(SqlSession sqlsession) {
	      this.sqlsession = sqlsession;
	      System.out.println(this.sqlsession);
	   }
	   
	   //Emp 전체 검색
	   public List<Emp> showEmpList(){
		   List<Emp> list = null;
		   Hr_infoDao dao = sqlsession.getMapper(Hr_infoDao.class);
		   list = dao.showEmpList();
		   //System.out.println("뿌려바");
		   //System.out.println(list);
		   return list;
		   
	   }
	   
	   //Emp 조건 검색
	   public List<Emp> searchEmp(Map<String, Object> map) {
		    Hr_infoDao dao = sqlsession.getMapper(Hr_infoDao.class);
		    List<Emp> emplist = dao.searchEmp(map);
		    //System.out.println("여기가 리스트");
		    //System.out.println(emplist);
			return emplist;
		}
	   
	   //OrgHead 검색
	   public List<DeptTest> showOrg(){
		   Hr_infoDao dao = sqlsession.getMapper(Hr_infoDao.class);
		   List<DeptTest> headlist = dao.showOrg();
		   
		   //System.out.println(headlist);
		   return headlist;
	   }
	   
	   //조직도 부서별 조회
	   public List<DeptTest> showOrgbyDept(String param){
		   Hr_infoDao dao = sqlsession.getMapper(Hr_infoDao.class);
		   List<DeptTest> emplist = dao.showOrgbyDept(param);
		   System.out.println(emplist);
		   return emplist;
	   }
	   

	   
	   
	   
}
