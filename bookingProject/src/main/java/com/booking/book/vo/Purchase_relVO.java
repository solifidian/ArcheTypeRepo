package com.booking.book.vo;

public class Purchase_relVO extends BookVO {
	private String isbn="";	//isbn
	private int p_no;		//주문번호
	private int p_amount;	//수량
	
	
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	public int getP_amount() {
		return p_amount;
	}
	public void setP_amount(int p_amount) {
		this.p_amount = p_amount;
	}
	
	
	
	
	
}
