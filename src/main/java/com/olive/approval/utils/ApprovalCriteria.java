package com.olive.approval.utils;

import lombok.Data;
import paging.Criteria;

@Data
public class ApprovalCriteria extends Criteria {
	
	private String searchType2; // 검색타입
	private String keyword2; // 검색어
	
	public ApprovalCriteria() {
		this.searchType2="1";
		this.keyword2=this.searchType2;
	}
	

}
