package com.booking.purchase.vo;

import com.booking.book.vo.BookVO;

public class PurchaseVO extends BookVO{
   private	int p_no=0;
   private	int p_abprice=0;
   private String p_date="";
   private	int m_no=0;
   private	int p_totprice=0;
   private	double p_discount=0d;
   private String coupon_code="";
   private String cookie_name="";
   private String m_phone="";
   private String m_post_address="";
   private String m_name="";
   private	int p_agreement =0;  //주문동의 0=no 1=yes
   private String p_method="";
   
   private String isbn;
   private int bookea;
   private String m_id="";
   private int nowpay=0; //즉시주문인지 구별 0 일반구매 1즉시주문
   
   
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
public double getP_discount() {
	return p_discount;
}
public void setP_discount(double p_discount) {
	this.p_discount = p_discount;
}
public String getCoupon_code() {
	return coupon_code;
}
public void setCoupon_code(String coupon_code) {
	this.coupon_code = coupon_code;
}
public String getCookie_name() {
	return cookie_name;
}
public void setCookie_name(String cookie_name) {
	this.cookie_name = cookie_name;
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
public int getP_agreement() {
	return p_agreement;
}
public void setP_agreement(int p_agreement) {
	this.p_agreement = p_agreement;
}
public String getP_method() {
	return p_method;
}
public void setP_method(String p_method) {
	this.p_method = p_method;
}
public String getIsbn() {
	return isbn;
}
public void setIsbn(String isbn) {
	this.isbn = isbn;
}
public int getBookea() {
	return bookea;
}
public void setBookea(int bookea) {
	this.bookea = bookea;
}
public String getM_id() {
	return m_id;
}
public void setM_id(String m_id) {
	this.m_id = m_id;
}
public int getNowpay() {
	return nowpay;
}
public void setNowpay(int nowpay) {
	this.nowpay = nowpay;
}
   
   
   
   
   
   
  
  
  
  
  
  
  
  
  
  
}
