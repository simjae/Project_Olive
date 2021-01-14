/*
	파일명: Hr_managementService.java
    설명: 인사관리 Service 
    작성일: 2021-01-02
    작성자: 백희승
*/
package com.olive.hr_management.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.olive.dto.Class;
import com.olive.dto.Dept;
import com.olive.dto.Emp;
import com.olive.dto.Head;
import com.olive.dto.Position;
import com.olive.dto.Sal_Record;
import com.olive.dto.SalaryInfo;
import com.olive.hr_management.dao.Hr_managementDao;
import com.olive.utils.ExcelRead;
import com.olive.utils.ExcelReadOption;

@Service
public class Hr_managementService {

	private SqlSession sqlsession;

	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
		System.out.println(this.sqlsession);
	}

	// 인사관리 : 사원 신규 등록
	public void insertNewEmp(Emp emp) {
		Hr_managementDao dao = sqlsession.getMapper(Hr_managementDao.class);
		dao.insertNewEmp(emp);
		System.out.println("서비스단 거침스");
	}

	// 인사관리 : 사원 리스트 출력 테스트
	public List<Emp> selectAllList() {
		List<Emp> list = new ArrayList<Emp>();
		Hr_managementDao dao = sqlsession.getMapper(Hr_managementDao.class);
		list = dao.selectAllList();
		return list;
	}

	// 인사관리 : 사원 신규 등록 시 Ajax 사번 중복 검증용
	public Emp checkEmpNo(String empNo) {
		Hr_managementDao dao = sqlsession.getMapper(Hr_managementDao.class);
		Emp dto = dao.checkEmpNo(empNo);
		return dto;
	}

	// 인사관리 : 사원 신규 등록 시 Ajax 본부 목록 호출
	public List<Head> getHeadQuarters() {
		Hr_managementDao dao = sqlsession.getMapper(Hr_managementDao.class);
		List<Head> HQList = dao.getHeadQuarters();
		return HQList;
	}

	// 인사관리 : 사원 신규 등록 시 Ajax 본부 코드 선택 시 부서 코드 호출
	public List<Dept> getDepartments(String headCode) {
		Hr_managementDao dao = sqlsession.getMapper(Hr_managementDao.class);
		List<Dept> deptList = dao.getDepartments(headCode);
		return deptList;
	}

	// 인사관리 : 사원 신규 등록 시 포지션(임무) 가져오기
	public List<Position> getPositions() {
		Hr_managementDao dao = sqlsession.getMapper(Hr_managementDao.class);
		List<Position> positionList = dao.getPositions();
		return positionList;
	}

	// 인사관리 : 사원 신규 등록 시 클래스(직급) 가져오기
	public List<Class> getClasses() {
		Hr_managementDao dao = sqlsession.getMapper(Hr_managementDao.class);
		List<Class> classList = dao.getClasses();
		return classList;
	}
	
	
	public SalaryInfo getSalaryDetail(String date, int empno) {
		Hr_managementDao dao = sqlsession.getMapper(Hr_managementDao.class);
		Map parameter = new HashMap<String, Object>();
		parameter.put("sal_date", date);
		parameter.put("empno", empno);
		return dao.getSalaryDetail(parameter);

	}

	public boolean excelUpload(File destFile) {
		boolean result = false;
		ExcelReadOption excelReadOption = new ExcelReadOption();
		excelReadOption.setFilePath(destFile.getAbsolutePath());
		excelReadOption.setOutputColumns("지급일자", "사번", "기본급", "시간외수당", "직책수당", "상여금", "차량유지", "식대", "교육지원");
		excelReadOption.setStartRow(2);
		List<Map<String, String>> excelContent = ExcelRead.read(excelReadOption);

		if (!excelContent.isEmpty()) {
			result = true;
			List<Sal_Record> excelData = new ArrayList<>();
			Sal_Record salRecord = null;
			for (int i = 0; i < excelContent.size(); i++) {
				if (excelContent.get(i).size() == 9) {
					salRecord = new Sal_Record();
					salRecord.setSal_date(excelContent.get(i).get("지급일자"));
					salRecord.setEmpno(Integer.parseInt(excelContent.get(i).get("사번")));
					salRecord.setBasic_pay(Integer.parseInt(excelContent.get(i).get("기본급")));
					salRecord.setOvertime_pay(Integer.parseInt(excelContent.get(i).get("시간외수당")));
					salRecord.setPosition_pay(Integer.parseInt(excelContent.get(i).get("직책수당")));
					salRecord.setBonus(Integer.parseInt(excelContent.get(i).get("상여금")));
					salRecord.setMaintenance_of_vehicle(Integer.parseInt(excelContent.get(i).get("차량유지")));
					salRecord.setMess_allowance(Integer.parseInt(excelContent.get(i).get("식대")));
					salRecord.setEducational_supports(Integer.parseInt(excelContent.get(i).get("교육지원")));
					salRecord.calcTax();
					excelData.add(salRecord);
				}
			}
			Hr_managementDao dao = sqlsession.getMapper(Hr_managementDao.class);
			dao.insertSalaryTbl(excelData);
		}
		return result;
	}

	public String createEmpno(String empno) {
		Hr_managementDao dao = sqlsession.getMapper(Hr_managementDao.class);
		String checkNum= null;
		String result;
		checkNum = dao.checkEmpno(empno);
		if(checkNum != null) {
			result = ""+(Integer.parseInt(checkNum)+1);
		}else {
			result = empno + "001";
		}
		return result;
	}
}
