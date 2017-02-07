package com.booking.admin.sitelog.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.booking.admin.sitelog.vo.SiteLogVO;

@Repository
public class SiteLogDAOImpl implements SiteLogDAO{

	@Autowired
	private SqlSession session;
	
	
	@Override
	public List<SiteLogVO> siteLogList(SiteLogVO slvo) {
		return session.selectList("siteLogList",slvo);
	}

	@Override
	public int siteLogTotal(SiteLogVO slvo) {
		return session.selectOne("siteLogTotal",slvo);
	}

	@Override
	public int siteLogInsert(SiteLogVO slvo) {
		return session.insert("siteLogInsert",slvo);
	}

}
