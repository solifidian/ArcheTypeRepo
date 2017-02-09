package com.booking.coupon.dao;

import com.booking.coupon.vo.CouponVO;

public interface CouponDAO {

	 public int couponInsert(CouponVO cvo); 
	 public int couponCheck(CouponVO cvo);

}
