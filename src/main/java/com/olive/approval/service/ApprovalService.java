package com.olive.approval.service;

import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.olive.approval.dao.ApprovalDao;
import com.olive.dto.Approver;
import com.olive.dto.Dept;
import com.olive.dto.Doc_Type;
import com.olive.dto.Document;
import com.olive.dto.Emp;
import com.olive.dto.Head;
import com.olive.dto.Refference;

@Service
public class ApprovalService {

	private SqlSession sqlsession;

	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
		System.out.println(this.sqlsession);
	}

	public Emp selectEmp(String empno) {
		ApprovalDao approvalDao = sqlsession.getMapper(ApprovalDao.class);
		return approvalDao.selectEmp(empno);
	}

	public List<Doc_Type> selectDocType() {
		ApprovalDao approvalDao = sqlsession.getMapper(ApprovalDao.class);
		return approvalDao.selectDocType();
	}

	public void writeDoc(Document doc, HttpServletRequest request) {
		ApprovalDao approvalDao = sqlsession.getMapper(ApprovalDao.class);
		List<Approver> appList = new ArrayList();
		List<Refference> refList = new ArrayList();
		
		CommonsMultipartFile multifile = doc.getFile();
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
				e.printStackTrace();
			}
		}
		
		doc.setFilename(filename);
		int i = 1;
		int j = 1;
		if (request.getParameter("app1") != null) {
			while (!request.getParameter("app" + i).equals("")) {
				System.out.println("app" + i + " : >" + request.getParameter("app" + i) + "<");
				Approver approver = new Approver();
				approver.setEmpNo(Integer.parseInt(request.getParameter("app" + i)));
				approver.setApp_Order(i);
				doc.setTotal_Approval(i);
				appList.add(approver);
				i++;
			}
		}

		if (request.getParameter("referrer1") != null) {
			while (request.getParameter("referrer" + j) != null) {
				Refference referrer = new Refference();
				referrer.setEmpno(Integer.parseInt(request.getParameter("referrer" + j)));
				refList.add(referrer);
				j++;
			}

		}

		doc.setApprovers(appList);
		doc.setReferrers(refList);
		System.out.println(doc);
	   approvalDao.writeDocument(doc);
	}

	public List<Emp> getAllEmpList() {
		ApprovalDao approvalDao = sqlsession.getMapper(ApprovalDao.class);
		return approvalDao.getAllEmpList();
	}

	public List<Dept> getAllDeptList() {
		ApprovalDao approvalDao = sqlsession.getMapper(ApprovalDao.class);
		return approvalDao.getAllDeptList();
	}

	public List<Head> getAllHeadList() {
		ApprovalDao approvalDao = sqlsession.getMapper(ApprovalDao.class);
		return approvalDao.getAllHeadList();
	}

}
