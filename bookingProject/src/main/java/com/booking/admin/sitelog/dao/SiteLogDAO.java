package com.booking.admin.sitelog.dao;

import java.util.List;

import com.booking.admin.sitelog.vo.SiteLogVO;

public interface SiteLogDAO {

	public List<SiteLogVO> siteLogList(SiteLogVO slvo);
	public int siteLogTotal(SiteLogVO slvo);
	
	public int siteLogInsert(SiteLogVO slvo);
	
	
}
