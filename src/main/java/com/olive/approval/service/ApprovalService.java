package com.olive.approval.service;

import java.io.FileOutputStream;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.olive.approval.dao.ApprovalDao;
import com.olive.dto.Approver;
import com.olive.dto.Dept;
import com.olive.dto.Doc_Type;
import com.olive.dto.Document;
import com.olive.dto.Emp;
import com.olive.dto.EmpTest;
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
	
	
	//전체 뽑기 
	public List<Document> getDocument (String empno){
		ApprovalDao approvalDao = sqlsession.getMapper(ApprovalDao.class);
		List<Document> document = approvalDao.getDocument(empno);
		
		return document;
	}
	
	//전자결재 메인페이지 들어올때 필요한 최근 문서 정보 
	public List<Document> getDocument (String empno,int start, int size){
		ApprovalDao approvalDao = sqlsession.getMapper(ApprovalDao.class);
		List<Document> document = approvalDao.getDocumentRec(empno,start,size);
		
		return document;
	}
	//내가 기안한 문서 분류하기
	public Map arrangeDoc(List<Document> document){
		Map<String, List<Document>> arrangedDoc = new HashMap();
		List<Document> doc_ready=new ArrayList();
		List<Document> doc_ing=new ArrayList();
		List<Document> doc_cmp=new ArrayList();
		List<Document> doc_rej=new ArrayList();
		for(Document doc : document) {
			if(doc.getStatusCode()==10) {
				doc_ready.add(doc);
			}else if(doc.getStatusCode()==20) {
				doc_ing.add(doc);
			}else if(doc.getStatusCode()==30) {
				doc_cmp.add(doc);
			}else if(doc.getStatusCode()==40) {
				doc_rej.add(doc);
			}
		}
		arrangedDoc.put("doc_ready",doc_ready);
		arrangedDoc.put("doc_ing",doc_ing);
		arrangedDoc.put("doc_cmp",doc_cmp);
		arrangedDoc.put("doc_rej",doc_rej);
		
		return arrangedDoc;
	}
	
	//내가 결재자인 문서 분류
	public Map arrangedAppDoc(List<Approver> approver){
		Map<String, List<Approver>> arrangedAppDoc = new HashMap();
		List<Approver> doc_ready=new ArrayList();
		List<Approver> doc_ing=new ArrayList();
		List<Approver> doc_cmp=new ArrayList();
		List<Approver> doc_rej=new ArrayList();
		for(Approver doc : approver) {
			if(doc.getCurr_Approval()==0) {
				doc_ready.add(doc);
			}else if(doc.getCurr_Approval()>0 && doc.getTotal_Approval()>doc.getCurr_Approval()) {
				doc_ing.add(doc);
			}else if(doc.getCurr_Approval()==doc.getTotal_Approval()) {
				doc_cmp.add(doc);
			}else {
				doc_rej.add(doc);
			}
		}
		
		arrangedAppDoc.put("doc_ready",doc_ready);
		arrangedAppDoc.put("doc_ing",doc_ing);
		arrangedAppDoc.put("doc_cmp",doc_cmp);
		arrangedAppDoc.put("doc_rej",doc_rej);
		
		return arrangedAppDoc;
	}
	
	
	public List<Approver> getApprover(String empno){
		ApprovalDao approvalDao = sqlsession.getMapper(ApprovalDao.class);
		return approvalDao.getApprover(empno);
	}
	public List<Approver> getApprover(String empno,int start, int size){
		ApprovalDao approvalDao = sqlsession.getMapper(ApprovalDao.class);
		return approvalDao.getApproverRec(empno,start,size);
	}
	public List<Refference> getRefference(String empno){
		ApprovalDao approvalDao = sqlsession.getMapper(ApprovalDao.class);
		return approvalDao.getRefference(empno);
	}

	//기안하기 페이지 들어갈때 필요한 개인정보
	public EmpTest selectEmp(String empno) {
		ApprovalDao approvalDao = sqlsession.getMapper(ApprovalDao.class);
		return approvalDao.selectEmp(empno);
	}

	//기안하기 페이지 들어갈때 필요한 문서종류 정보
	public List<Doc_Type> selectDocType() {
		ApprovalDao approvalDao = sqlsession.getMapper(ApprovalDao.class);
		return approvalDao.selectDocType();
	}

	@Transactional //기안하기
	public void writeDoc(Document doc, HttpServletRequest request) throws Exception {
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
		//결재자 추가 
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
		// 참조자 추가
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

		//Transaction 
		try {
			approvalDao.writeDocument(doc);
			approvalDao.insertApprover(doc);
			approvalDao.insertReferrer(doc);
			System.out.println("정상처리");

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Transaction Exception :" + e.getMessage());
			throw e;
		}

	}
	
	//전자결재 메인페이지에서 결재상태 비동기용 , 개인 문서함
	public List<Document> getArrangedDocList(String statusCode, Principal principal){
		ApprovalDao approvalDao = sqlsession.getMapper(ApprovalDao.class);
		
		
		return approvalDao.getArrangedDocList(statusCode,principal.getName());
	}
	
	//전자결재 메인페이지에서 내가 받은  결재상태 비동기용 , 결재 문서함
	public List<Approver> getArrangedAppList(String statusCode, Principal principal){
		ApprovalDao approvalDao = sqlsession.getMapper(ApprovalDao.class);
		
		
		return approvalDao.getArrangedAppList(statusCode,principal.getName());
	}

	public List<Emp> getAllEmpList() { //결재선용
		ApprovalDao approvalDao = sqlsession.getMapper(ApprovalDao.class);
		return approvalDao.getAllEmpList();
	}

	public List<Dept> getAllDeptList() { //결재선용
		ApprovalDao approvalDao = sqlsession.getMapper(ApprovalDao.class);
		return approvalDao.getAllDeptList();
	}

	public List<Head> getAllHeadList() { //결재선용
		ApprovalDao approvalDao = sqlsession.getMapper(ApprovalDao.class);
		return approvalDao.getAllHeadList();
	}
	public Document viewDocumnet(String docno) {//문서 조회시
		ApprovalDao approvalDao = sqlsession.getMapper(ApprovalDao.class);
		approvalDao.viewDocument(docno);
		
		return approvalDao.viewDocument(docno);
	}
	public List<Approver> viewApprovers(String docno) {//문서 조회시 결재자
		ApprovalDao approvalDao = sqlsession.getMapper(ApprovalDao.class);
		approvalDao.viewApprovers(docno);
		
		return approvalDao.viewApprovers(docno);
	}

}
