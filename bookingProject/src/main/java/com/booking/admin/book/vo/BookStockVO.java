package com.booking.admin.book.vo;

import com.booking.book.vo.BookVO;

public class BookStockVO extends BookVO{

	private int st_no; // 입고번호
	
	private String isbn; // ISBN
	
	private String st_date; // 입고일
	
	private int st_amount; // 입고수
	
	private String st_name; // 입고명

	private int st_name_no; // 입고명 번호
	
	public int getSt_no() {
		return st_no;
	}

	public void setSt_no(int st_no) {
		this.st_no = st_no;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getSt_date() {
		return st_date;
	}

	public void setSt_date(String st_date) {
		this.st_date = st_date;
	}

	public int getSt_amount() {
		return st_amount;
	}

	public void setSt_amount(int st_amount) {
		this.st_amount = st_amount;
	}

	public String getSt_name() {
		return st_name;
	}

	public void setSt_name(String st_name) {
		this.st_name = st_name;
	}

	public int getSt_name_no() {
		return st_name_no;
	}

	public void setSt_name_no(int st_name_no) {
		this.st_name_no = st_name_no;
	}
	
	
	
	
}
