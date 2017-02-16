package com.booking.purchase.service;

import java.util.List;

import com.booking.coupon.vo.CouponVO;
import com.booking.purchase.vo.PurchaseVO;

public interface PurchaseService {
    public int purchaseUpdate(PurchaseVO pvo);
	public int cartAllDelete(PurchaseVO pvo);
	public int  purchaseBookRel(PurchaseVO pvo);
	public PurchaseVO nowPay(String isbn);
	
	public List<PurchaseVO> purchaseDetail(int p_no);
	public List<CouponVO> couponList(PurchaseVO pvo);
    public int givePoint(PurchaseVO pvo);
    public int useCouponDelete(PurchaseVO pvo);
    public int searchp_no(PurchaseVO pvo);

}
