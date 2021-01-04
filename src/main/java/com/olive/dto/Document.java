package com.olive.dto;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

import lombok.Data;

@Data
public class Document {
	private int docno;
	private int empno;
	private Date writedate;
	private String content;
	private int total_Approval;
	private int curr_Approval;
	private String filename;
	private int statusCode;
	private int typeCode;
	private CommonsMultipartFile file;
	private List<Approver> approvers;
	private String title;
	private Date starttime;
	private Date endtime;
	private List<Refference> referrers;
}
