package paging;

import java.util.List;
import java.util.Map;

public interface PagingDao {
	public int getListCount(Criteria cri);
	public List<Map<String, Object>> getList(Criteria cri);
}
