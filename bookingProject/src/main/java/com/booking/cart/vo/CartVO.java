package com.booking.cart.vo;

import com.booking.search.vo.SearchVO;

public class CartVO extends SearchVO {
		private int m_no =0;
		private String isbn="";
		private String cart_ip="";
		private int cart_amount=0;
		private String m_id="";
		
		public String getM_id() {
			return m_id;
		}
		public void setM_id(String m_id) {
			this.m_id = m_id;
		}
		public int getM_no() {
			return m_no;
		}
		public void setM_no(int m_no) {
			this.m_no = m_no;
		}
		public String getIsbn() {
			return isbn;
		}
		public void setIsbn(String isbn) {
			this.isbn = isbn;
		}
		public String getCart_ip() {
			return cart_ip;
		}
		public void setCart_ip(String cart_ip) {
			this.cart_ip = cart_ip;
		}
		public int getCart_amount() {
			return cart_amount;
		}
		public void setCart_amount(int cart_amount) {
			this.cart_amount = cart_amount;
		}
		
		

}
	