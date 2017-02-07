package com.booking.purchase.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.booking.purchase.vo.PurchaseVO;
@Repository
public class PurchaseDAOImpI implements PurchaseDAO{

		@Autowired
		public SqlSession session;
	
	@Override
	public int purchaseUpdate(PurchaseVO pvo) {
		// TODO Auto-generated method stub
		return (int)session.insert("purchaseUpdate");
	}

	@Override
	public int cartAllDelete(PurchaseVO pvo) {
		// TODO Auto-generated method stub
		return (int)session.delete("cartAllDelete");
	}

	@Override
	public int purchaseBookRel(PurchaseVO pvo) {
		// TODO Auto-generated method stub
		return (int)session.insert("purchaseBookRel");
	}

	@Override
	public PurchaseVO nowPay(String isbn) {
		// TODO Auto-generated method stub
		return session.selectOne("nowPay",isbn);
	}
	
	public List<PurchaseVO> purchaseDetail(int p_no){
		return session.selectList("puchaseDetail",p_no);
	}

}
