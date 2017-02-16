package com.booking.purchase.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.booking.coupon.vo.CouponVO;
import com.booking.purchase.dao.PurchaseDAO;
import com.booking.purchase.vo.PurchaseVO;

@Service
@Transactional
public class PurchaseServiceImpI implements PurchaseService {

	
		@Autowired 
		public PurchaseDAO purchaseDAO;
	
	
	@Override
	public int purchaseUpdate(PurchaseVO pvo) {
		// TODO Auto-generated method stub
		return purchaseDAO.purchaseUpdate(pvo);
	}


	@Override
	public int cartAllDelete(PurchaseVO pvo) {
		// TODO Auto-generated method stub
		return purchaseDAO.cartAllDelete(pvo);
	}


	@Override
	public int purchaseBookRel(PurchaseVO pvo) {
		// TODO Auto-generated method stub
		return purchaseDAO.purchaseBookRel(pvo);
	}


	@Override
	public PurchaseVO nowPay(String isbn) {
		// TODO Auto-generated method stub
		return purchaseDAO.nowPay(isbn);
	}
	
	public List<PurchaseVO> purchaseDetail(int p_no){
		return purchaseDAO.purchaseDetail(p_no);
	}

	@Override
	public List<CouponVO> couponList(PurchaseVO pvo) {
		// TODO Auto-generated method stub
		
			
		List<CouponVO> cvo=null;
		cvo=purchaseDAO.couponList(pvo);
		
		return cvo;
	}


	@Override
	public int givePoint(PurchaseVO pvo) {
		// TODO Auto-generated method stub
		return purchaseDAO.givePoint(pvo);
	}


	@Override
	public int useCouponDelete(PurchaseVO pvo) {
		// TODO Auto-generated method stub
		return purchaseDAO.useCouponDelete(pvo);
	}


	@Override
	public int searchp_no(PurchaseVO pvo) {
		// TODO Auto-generated method stub
		return purchaseDAO.searchp_no(pvo);
	}

 
}
