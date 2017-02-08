package com.booking.bookReply.vo;

public class BookReplyVO {
	private String 	isbn		 = "";		//isbn
	private int 	br_score 	 = 0;		//평점
	private int 	br_no 		 = 0;		//평가댓글번호
	private String 	br_writer 	 = "";		//글쓴이
	private String 	br_update 	 = "";		//작성일
	private String 	br_content 	 = "";		//내용
	private String 	br_editdate	 = "";		//수정일
	
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public int getBr_score() {
		return br_score;
	}
	public void setBr_score(int br_score) {
		this.br_score = br_score;
	}
	public int getBr_no() {
		return br_no;
	}
	public void setBr_no(int br_no) {
		this.br_no = br_no;
	}
	public String getBr_writer() {
		return br_writer;
	}
	public void setBr_writer(String br_writer) {
		this.br_writer = br_writer;
	}
	public String getBr_update() {
		return br_update;
	}
	public void setBr_update(String br_update) {
		this.br_update = br_update;
	}
	public String getBr_content() {
		return br_content;
	}
	public void setBr_content(String br_content) {
		this.br_content = br_content;
	}
	public String getBr_editdate() {
		return br_editdate;
	}
	public void setBr_editdate(String br_editdate) {
		this.br_editdate = br_editdate;
	}
	
	
	
}
