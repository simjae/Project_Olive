package com.olive.hr_info.service;

import java.io.FileOutputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

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
	   public List<EmpTest> showEmpList(){
		   List<EmpTest> list = null;
		   Hr_infoDao dao = sqlsession.getMapper(Hr_infoDao.class);
		   list = dao.showEmpList();
		   //System.out.println("뿌려바");
		   System.out.println(list);
		   return list;
		   
	   }
	   
	   //Emp 조건 검색 selectbox (사번, 이름, 부서)
	   public List<EmpTest> searchEmp(Map<String, Object> map) {
		    Hr_infoDao dao = sqlsession.getMapper(Hr_infoDao.class);
		    List<EmpTest> emplist = dao.searchEmp(map);
		    //System.out.println("여기가 리스트");
		    //System.out.println(emplist);
			return emplist;
		}
	   
	   //Emp 사번으로 검색 //Mypage에 일단 쓰는중 //modal에도 쓸거임
	   //수정 >> empinfo로 가져올 것
	   public Map<String, Object> searchEmpByEmpno(String empno){
		   Hr_infoDao dao = sqlsession.getMapper(Hr_infoDao.class);
		   Map<String, Object> emp = dao.searchEmpByEmpno(empno);
		   System.out.println("Mypage 수정중 ...");
		   System.out.println(emp);
		   return emp;
	   }
	   
	   //조직도 본부 조회 Main (미완성)
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
	   
	   //마이페이지 수정
	   public void updateMyInfo(Emp emp, HttpServletRequest request) {
		   Hr_infoDao dao = sqlsession.getMapper(Hr_infoDao.class);
		   
		   CommonsMultipartFile multifile =emp.getFile();
		   String filename = multifile.getOriginalFilename();
			String path = request.getServletContext().getRealPath("/resources/upload");
			System.out.println(path);
			String fpath = path + "/" + filename;
			if (!filename.equals("")) {
				// 실 파일 업로드
				try {
					FileOutputStream fs = new FileOutputStream(fpath);
					fs.write(multifile.getBytes());
					fs.close();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();			}
			}
			
			emp.setPic(filename);
			dao.updateMyInfo(emp);
		   System.out.println("Update 완료");
		   
	   }
	   
	   

	   
	   
	   
}
