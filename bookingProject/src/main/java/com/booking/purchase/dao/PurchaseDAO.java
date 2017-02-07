package com.booking.purchase.dao;

import java.util.List;

import com.booking.purchase.vo.PurchaseVO;

public interface PurchaseDAO {
    public int purchaseUpdate(PurchaseVO pvo);
	public int cartAllDelete(PurchaseVO pvo);
	public int purchaseBookRel(PurchaseVO pvo);
	public PurchaseVO nowPay(String isbn);
	
	public List<PurchaseVO> purchaseDetail(int p_no);


}
