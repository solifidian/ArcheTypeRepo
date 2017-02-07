package com.booking.cart.service;

import java.util.List;

import com.booking.cart.vo.CartVO;

public interface CartService {
	public List<CartVO> cartlist(CartVO cvo);
	public int cartTableBookDelete(CartVO cvo);
	public int cartInsert(CartVO cvo);
	public int cartUpdate(CartVO cvo);
	public int cartTableBookUpdate(CartVO cvo);
	public int cartAllDelete(String m_id);
	public List<CartVO>nowpaycartlist(CartVO cvo);
	
	public int searchM_no(String m_id);
	public int isbnNumberCheck(CartVO cvo);
	
}
