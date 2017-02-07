package com.booking.admin.sitelog.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.booking.admin.sitelog.dao.SiteLogDAO;
import com.booking.admin.sitelog.vo.SiteLogVO;

@Service
@Transactional
public class SiteLogServiceImpl implements SiteLogService{

	@Autowired
	private SiteLogDAO siteLogDAO;
	
	
	@Override
	public List<SiteLogVO> siteLogList(SiteLogVO slvo) {
		List<SiteLogVO> siteLogList = siteLogDAO.siteLogList(slvo);
		if(siteLogList != null){
			siteLogList.get(0).setSearchTotal(siteLogDAO.siteLogTotal(slvo));
		}
		return siteLogList;
	}

	@Override
	public int siteLogInsert(SiteLogVO slvo) {
		
		int success = siteLogDAO.siteLogInsert(slvo);
		
		return success;
	}
	
	@Override
	public int siteLogUpdate(HttpServletRequest request, String log_title, String log_comment){
		
		SiteLogVO slvo = new SiteLogVO();
		slvo.setLog_ip(request.getRemoteAddr());
		slvo.setLog_title(log_title);
		slvo.setLog_comment(log_comment);
		int success = siteLogDAO.siteLogInsert(slvo);
		
		return success;
	}

	
}
