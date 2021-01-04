package com.olive.hr_info.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.olive.dto.Emp;
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
		   System.out.println("뿌려바");
		   System.out.println(list);
		   return list;
		   
	   }
	   
	   //Emp 사번 검색
	   public List<Emp> searchByEmpno(String empno) {
		    Hr_infoDao dao = sqlsession.getMapper(Hr_infoDao.class);
		    List<Emp> emplist = dao.searchByEmpno(empno);
			return emplist;
		}
	   
	   //Emp 이름 검색
	   public List<Emp> searchByEname(String ename) {
		    Hr_infoDao dao = sqlsession.getMapper(Hr_infoDao.class);
		    List<Emp> emplist = dao.searchByEname(ename);
		    System.out.println("이름검색인디");
			return emplist;
		}
	   
	   //Emp 부서 검색
	   public List<Emp> searchByDept(String deptname) {
		    Hr_infoDao dao = sqlsession.getMapper(Hr_infoDao.class);
		    List<Emp> emplist = dao.searchByDept(deptname);
			return emplist;
		}
	   
	   
	   
}
