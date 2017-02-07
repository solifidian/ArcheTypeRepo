package com.booking.admin.sitelog.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.booking.admin.sitelog.vo.SiteLogVO;

public interface SiteLogService {

	public List<SiteLogVO> siteLogList(SiteLogVO slvo);
	
	public int siteLogInsert(SiteLogVO slvo);
	
	public int siteLogUpdate(HttpServletRequest request, String log_title, String log_comment);
}
