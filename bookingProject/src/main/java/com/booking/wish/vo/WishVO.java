package com.booking.wish.vo;

import com.booking.search.vo.SearchVO;

public class WishVO extends SearchVO{
	
	private int wishlist_no=0;
	private String isbn="";
	private int m_no=0;
	private String m_id="";
	
	
	
	public int getWishlist_no() {
		return wishlist_no;
	}
	public void setWishlist_no(int wishlist_no) {
		this.wishlist_no = wishlist_no;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	
	
	

}
