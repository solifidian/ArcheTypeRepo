package com.booking.common.paging;

import com.booking.common.util.Util;
import com.booking.common.vo.ListCommonVO;

public class Paging {

	public static ListCommonVO setBookPaging(ListCommonVO lcvo){
		int page = Util.nvl(lcvo.getPage(), 1);
		int pageSize = Util.nvl(lcvo.getPageSize(),10);
		
		if(lcvo.getPage() == null){
			lcvo.setPage(page+"");
		}
		if(lcvo.getPageSize() == null){
			lcvo.setPageSize(pageSize+"");
		}
		
		int searchStartRow = (page-1)*pageSize + 1;
		int searchEndRow = (page-1)*pageSize + pageSize;
		
		lcvo.setSearchStartRow(searchStartRow);
		lcvo.setSearchEndRow(searchEndRow);
		
		return lcvo;
	}
	
	
}
