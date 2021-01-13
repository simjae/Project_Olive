package com.olive.approval.dao;

import java.util.List;
import java.util.Map;

import com.olive.dto.Approver;
import com.olive.dto.Dept;
import com.olive.dto.Doc_Type;
import com.olive.dto.Document;
import com.olive.dto.Emp;
import com.olive.dto.EmpTest;
import com.olive.dto.Head;
import com.olive.dto.Reference;
import com.olive.utils.Criteria;
import com.olive.utils.dao.PagingDao;

public interface ApprovalDao extends PagingDao{
	public EmpTest selectEmp(String empno); //기안문서작성페이지 개인 정보
	public List<Doc_Type> selectDocType(); //기안 문서 작성페이지 문서 종류
	public List<Emp> getAllEmpList(); //결재선 결정시 
	public List<Dept> getAllDeptList(); //결재선 결정시 
	public List<Head> getAllHeadList(); //결재선 결정시 
	public void writeDocument(Document doc); //기안하기 문서 작성  
	public void insertApprover(Document doc); //결재자 추가 
	public void insertReferrer(Document doc); //참조자 추가
	public List<Document> getDocument(String empno); //전자결재 메인페이지
	public List<Document> getDocumentRec(String empno,int start, int size); //전자결재 메인페이지
	public List<Approver> getApprover(String empno); //전자결재 메인페이지 내가 받은 결재 
	public List<Approver> getApproverRec(String empno,int start, int size); //전자결재 메인페이지 페이징 내가 받은 결재 
	public List<Reference> getRefference(String empno); //전자결재 메인페이지 참조
	public List<Document> getArrangedDocList(String statusCode,String empno); //전자결재 내가 올린 결재 (테이블)
	public List<Approver> getArrangedAppList(String statusCode,String empno); //전자결재 내가 받은 결재 (테이블)
	public Document viewDocument(String docno);
	public List<Approver> viewApprovers(String docno);
	public void approve(Approver app);//승인
	public List<Map<String, Object>> getList(Criteria cri);
	public int getAppListCount(Criteria cri);
	public List<Map<String, Object>> getAppList(Criteria cri);
}
