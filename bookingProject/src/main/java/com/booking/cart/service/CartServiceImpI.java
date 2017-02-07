package com.booking.cart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.booking.cart.dao.CartDAO;
import com.booking.cart.vo.CartVO;

@Service 
@Transactional
public class CartServiceImpI implements CartService{
	
	@Autowired
	public CartDAO cartDAO;
	
	@Override
	public List<CartVO> cartlist(CartVO cvo) {
		// TODO Auto-generated method stub
		
		List<CartVO> list =null;
				list=cartDAO.cartlist(cvo);
		
		return list;
	}

	@Override
	public int cartTableBookDelete(CartVO cvo) {
		// TODO Auto-generated method stub
		return cartDAO.cartTableBookDelete(cvo);
	}

	@Override
	public int cartInsert(CartVO cvo) {
		// TODO Auto-generated method stub
		return cartDAO.cartInsert(cvo);
	}

	@Override
	public int searchM_no(String m_id) {
		// TODO Auto-generated method stub
		return cartDAO.searchM_no(m_id);
	}

	@Override
	public int isbnNumberCheck(CartVO cvo) {
		// TODO Auto-generated method stub
		return cartDAO.isbnNumberCheck(cvo);
	}

	@Override
	public int cartUpdate(CartVO cvo) {
		// TODO Auto-generated method stub
		return cartDAO.cartUpdate(cvo);
	}

	@Override
	public int cartTableBookUpdate(CartVO cvo) {
		// TODO Auto-generated method stub
		return (int)cartDAO.cartTableBookUpdate(cvo);
	}

	@Override
	public int cartAllDelete(String m_id) {
		// TODO Auto-generated method stub
		return (int)cartDAO.cartAllDelete(m_id);
	}

	@Override
	public List<CartVO> nowpaycartlist(CartVO cvo) {
		// TODO Auto-generated method stub
		List<CartVO> list =null;
		list=cartDAO.nowpaycartlist(cvo);

		return list;
	}

}
