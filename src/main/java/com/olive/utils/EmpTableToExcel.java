package com.olive.utils;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import com.olive.dto.Emp;

@SuppressWarnings("deprecation")
public class EmpTableToExcel extends AbstractExcelView{

	@Override
	protected void buildExcelDocument(Map<String, Object> model, HSSFWorkbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setHeader("Content-Disposition", "attachment; filename=\"EmpList.xls\";");
		HSSFSheet sheet = createFirstSheet(workbook);
		createColumnLabel(sheet);
		List<Emp> emplist = (List<Emp>)model.get("empList");
		int rowNum = 1;
		System.out.println("ExcelView : "+emplist);
		for(Emp emp : emplist) {
			System.out.println(rowNum);
			createColumnData(sheet, emp, rowNum);
			rowNum++;
		}
	}

	

	private HSSFSheet createFirstSheet(HSSFWorkbook workbook) {
		HSSFSheet sheet = workbook.createSheet();
		workbook.setSheetName(0, "EMP테이블");
		sheet.setDefaultColumnWidth(15);
		return sheet;
	}
	
	//Excel Sheet 1행(컬럼 생성)
		private void createColumnLabel(HSSFSheet sheet) {
			HSSFRow	row = sheet.createRow(0); //1행
			HSSFCell cell;
			cell = row.createCell(0);
			cell.setCellValue("empno");
			cell = row.createCell(1);
			cell.setCellValue("pwd");
			cell = row.createCell(2);
			cell.setCellValue("ename");
			cell = row.createCell(3);
			cell.setCellValue("email");
			cell = row.createCell(4);
			cell.setCellValue("hiredate");
			cell = row.createCell(5);
			cell.setCellValue("leavedate");
			cell = row.createCell(6);
			cell.setCellValue("annual");
			cell = row.createCell(7);
			cell.setCellValue("classcode");
			cell = row.createCell(8);
			cell.setCellValue("positioncode");
			cell = row.createCell(9);
			cell.setCellValue("deptcode");
			cell = row.createCell(10);
			cell.setCellValue("statuscode");
			cell = row.createCell(11);
			cell.setCellValue("logincount");
			cell = row.createCell(12);
			cell.setCellValue("alram");			
		}
		
		private void createColumnData(HSSFSheet sheet, Emp emp, int rowNum) {
			HSSFRow row = sheet.createRow(rowNum);
			HSSFCell cell;
			cell = row.createCell(0);
			cell.setCellValue(emp.getEmpNo());
			cell = row.createCell(1);
			cell.setCellValue(emp.getPwd());
			cell = row.createCell(2);
			cell.setCellValue(emp.getEname());
			cell = row.createCell(3);
			cell.setCellValue(emp.getEmail());
			cell = row.createCell(4);
			cell.setCellValue(emp.getHireDate());
			cell = row.createCell(5);
			cell.setCellValue(emp.getLeaveDate());
			cell = row.createCell(6);
			cell.setCellValue(emp.getAnnaul());
			cell = row.createCell(7);
			cell.setCellValue(emp.getClassCode());
			cell = row.createCell(8);
			cell.setCellValue(emp.getPositionCode());
			cell = row.createCell(9);
			cell.setCellValue(emp.getDeptCode());
			cell = row.createCell(10);
			cell.setCellValue(emp.getStatusCode());
			cell = row.createCell(11);
			cell.setCellValue(emp.getLoginCount());
			cell = row.createCell(12);
			cell.setCellValue(emp.getAlram());
		}
	
	
}
