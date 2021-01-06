package paging;

import java.util.List;

public interface PagingDao {
	
	public int getListCnt(String Tbl, String searchType, String keyword) throws Exception;
	public List<Object> getList(Pagination pagination) throws Exception;
}
