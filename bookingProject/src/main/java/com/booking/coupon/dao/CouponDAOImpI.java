package com.booking.coupon.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.booking.coupon.vo.CouponVO;

@Repository
public class CouponDAOImpI implements CouponDAO{

	@Autowired
	public SqlSession session;
	
	@Override
	public int couponInsert(CouponVO cvo) {
		// TODO Auto-generated method stub
		return (int)session.insert("couponInsert");
	}

	@Override
	public int couponCheck(CouponVO cvo) {
		// TODO Auto-generated method stub
		return (Integer)session.selectOne("couponCheck");
	}

}
