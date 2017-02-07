package com.booking.book.vo;

public class PurchaseVO {
	private int     p_no;			//주문번호	       
	private int     p_abprice;	   	//주문가격
	private String  p_date;	       	//주문일자
	private int     m_no;	       	//회원번호
	private int     p_totprice;	 	//최종가격
	private int     p_discount;	 	//할인률
	private String  coupon_code;	//쿠폰코드
	private String  m_phone;    	//핸드폰번호
	private String  m_post_address; //주소
	private String  m_name;	        //주문자명
	
	
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	public int getP_abprice() {
		return p_abprice;
	}
	public void setP_abprice(int p_abprice) {
		this.p_abprice = p_abprice;
	}
	public String getP_date() {
		return p_date;
	}
	public void setP_date(String p_date) {
		this.p_date = p_date;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public int getP_totprice() {
		return p_totprice;
	}
	public void setP_totprice(int p_totprice) {
		this.p_totprice = p_totprice;
	}
	public int getP_discount() {
		return p_discount;
	}
	public void setP_discount(int p_discount) {
		this.p_discount = p_discount;
	}
	public String getCoupon_code() {
		return coupon_code;
	}
	public void setCoupon_code(String coupon_code) {
		this.coupon_code = coupon_code;
	}
	public String getM_phone() {
		return m_phone;
	}
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}
	public String getM_post_address() {
		return m_post_address;
	}
	public void setM_post_address(String m_post_address) {
		this.m_post_address = m_post_address;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	
	
	
	
}
