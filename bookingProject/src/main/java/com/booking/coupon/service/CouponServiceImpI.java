package com.booking.coupon.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.booking.coupon.dao.CouponDAO;
import com.booking.coupon.vo.CouponVO;
@Service
@Transactional
public class CouponServiceImpI implements CouponService{

	@Autowired
	public CouponDAO couponDAO;
	
	@Override
	public int couponInsert(CouponVO cvo) {
		// TODO Auto-generated method stub
		return couponDAO.couponInsert(cvo);
	}

	@Override
	public int couponCheck(CouponVO cvo) {
		// TODO Auto-generated method stub
		return couponDAO.couponCheck(cvo);
	}

}
