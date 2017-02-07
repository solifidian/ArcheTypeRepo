package com.booking.cart.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.booking.cart.vo.CartVO;
@Repository
public class CartDAOImpI implements CartDAO {
    @Autowired
    public SqlSession session;
	
	@Override
	public List<CartVO> cartlist(CartVO cvo) {
		// TODO Auto-generated method stub
		return session.selectList("cartlist");
	}

	@Override
	public int cartTableBookDelete(CartVO cvo) {
		// TODO Auto-generated method stub
		return (int)session.delete("cartTableBookDelete");
	}

	@Override
	public int cartInsert(CartVO cvo) {
		// TODO Auto-generated method stub
		return (int)session.insert("cartInsert");
	}

	@Override
	public int searchM_no(String m_id) {
		// TODO Auto-generated method stub
		return (Integer)session.selectOne("searchM_no", m_id);
	}

	@Override
	public int isbnNumberCheck(CartVO cvo) {
		// TODO Auto-generated method stub
		return (Integer)session.selectOne("isbnNumberCheck");
	}

	@Override
	public int cartUpdate(CartVO cvo) {
		// TODO Auto-generated method stub
		return (int)session.update("cartUpdate");
	}

	@Override
	public int cartTableBookUpdate(CartVO cvo) {
		// TODO Auto-generated method stub
		return (int)session.update("cartTableBookUpdate");
	}

	@Override
	public int cartAllDelete(String m_id) {
		// TODO Auto-generated method stub
		return (int)session.delete("cartAllDelete",m_id);
	}

	@Override
	public List<CartVO> nowpaycartlist(CartVO cvo) {
		// TODO Auto-generated method stub
		return session.selectOne("nowpaycartlist");
	}

}
