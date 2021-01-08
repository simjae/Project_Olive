package paging;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	
	//Controller에서 직접 넣어줘야 되
	private String table; // Table OR View 이름
	private String column; // 정렬 컬럼
	private String sort; // 정렬 방법 (asc or desc)
	
	//View로부터 받는것
	private String searchType; // 검색타입
	private String keyword; // 검색어
	private int page;
	private int perPageNum;
	
	//자동으로 계산됨
	private int rowStart;
	
	public Criteria() {
		this.page = 1;
		this.perPageNum = 3;
		this.searchType = "1";
		this.keyword = this.searchType;
	}
	
	public void setPage(int page) {
		this.page = (page <= 0) ? 1 : page;
	}
	
	public void serPerPageNum(int perPageNum) {
		this.perPageNum = (perPageNum <= 0 || perPageNum > 100) ? 5 : perPageNum;
	}
	
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	
	private int setRowStart() {
		return ((page - 1) * perPageNum);
	}

	public void setCriteria(String table, String column, String sort) {
		this.table = table;
		this.column = column;
		this.sort = sort;
		this.rowStart = setRowStart();
	}

//	// 전체조회
//	public Criteria(String table, String column, String sort) {
//		this.table = table;
//		this.column = column;
//		this.sort = sort;
//		this.rowStart = getRowStart();
//	}
//
//	// 검색조회
//	public Criteria(String table, String column, String sort, String searchType, String keyword) {
//		this.table = table;
//		this.column = column;
//		this.sort = sort;
//		this.searchType = searchType;
//		this.keyword = keyword;
//		this.rowStart = getRowStart();
//	}
//
//	// 검색조회
//	public Criteria(String table, String column, String sort, String searchType, String keyword, int page, int perPageNum) {
//		this.table = table;
//		this.column = column;
//		this.sort = sort;
//		this.searchType = searchType;
//		this.keyword = keyword;
//		this.rowStart = getRowStart();
//	}


	
//	public int getPage() {
//		return page;
//	}
//
//	public int getPerPageNum() {
//		return this.perPageNum;
//	}

//	public int getRowEnd() {
//		rowEnd = rowStart + perPageNum - 1;
//		return rowEnd;
//	}
}
