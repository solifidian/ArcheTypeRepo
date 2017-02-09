package com.booking.admin.book.vo;

import com.booking.book.vo.BookVO;

public class BookReleaseVO extends BookVO{
	
	private int rel_no; // 출고번호
	
	private String isbn; // ISBN
	
	private String rel_name; //출고명
	
	private int rel_name_no; // 출고명 번호
	
	private String rel_date; // 출고일
	
	private int rel_amount; // 출고수량
	
	
	public int getRel_no() {
		return rel_no;
	}
	public void setRel_no(int rel_no) {
		this.rel_no = rel_no;
	}
	public String getRel_date() {
		return rel_date;
	}
	public void setRel_date(String rel_date) {
		this.rel_date = rel_date;
	}
	public int getRel_amount() {
		return rel_amount;
	}
	public void setRel_amount(int rel_amount) {
		this.rel_amount = rel_amount;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getRel_name() {
		return rel_name;
	}
	public void setRel_name(String rel_name) {
		this.rel_name = rel_name;
	}
	public int getRel_name_no() {
		return rel_name_no;
	}
	public void setRel_name_no(int rel_name_no) {
		this.rel_name_no = rel_name_no;
	}
	
	
}
