package com.booking.book.vo;

import com.booking.common.vo.ListCommonVO;

public class BookVO extends ListCommonVO{

	private String isbn; // ISBN number
	
	private String b_title = ""; // 도서명
	private String b_author = ""; // 글
	
	private String b_pubdate = ""; // 출판일
	private String b_update = ""; // 등록일
	private String b_editdate = ""; // 수정일
	private String b_size = ""; // 크기
	
	private int b_pagesize; // 쪽수
	private int b_abprice; // 정가
	private int b_stock; // 재고
	private double b_totscore; //최종 평점
	
	private int cat_no; // 분류 번호
	private String cat_name = ""; // 분류 표시
	private String pub_name = ""; // 출판사 이름
	private int i_no; // 이미지 번호
	
	private String b_index = ""; // 목차
	private String b_comment = ""; // 상세 설명
	private String b_complain = ""; // 교환,환불 절차
	
	private String series_name = ""; // 시리즈 명
	private int series_no; // 시리즈 주 번호
	private int series_no_sub; // 시리즈 부 번호
	
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_author() {
		return b_author;
	}
	public void setB_author(String b_author) {
		this.b_author = b_author;
	}

	public String getB_pubdate() {
		return b_pubdate;
	}
	public void setB_pubdate(String b_pubdate) {
		this.b_pubdate = b_pubdate;
	}
	public String getB_update() {
		return b_update;
	}
	public void setB_update(String b_update) {
		this.b_update = b_update;
	}
	public String getB_editdate() {
		return b_editdate;
	}
	public void setB_editdate(String b_editdate) {
		this.b_editdate = b_editdate;
	}
	public String getB_size() {
		return b_size;
	}
	public void setB_size(String b_size) {
		this.b_size = b_size;
	}
	public int getB_pagesize() {
		return b_pagesize;
	}
	public void setB_pagesize(int b_pagesize) {
		this.b_pagesize = b_pagesize;
	}
	public int getB_abprice() {
		return b_abprice;
	}
	public void setB_abprice(int b_abprice) {
		this.b_abprice = b_abprice;
	}
	public int getB_stock() {
		return b_stock;
	}
	public void setB_stock(int b_stock) {
		this.b_stock = b_stock;
	}
	public double getB_totscore() {
		return b_totscore;
	}
	public void setB_totscore(double b_totscore) {
		this.b_totscore = b_totscore;
	}
	public int getCat_no() {
		return cat_no;
	}
	public void setCat_no(int cat_no) {
		this.cat_no = cat_no;
	}
	public String getPub_name() {
		return pub_name;
	}
	public void setPub_name(String pub_name) {
		this.pub_name = pub_name;
	}
	public int getI_no() {
		return i_no;
	}
	public void setI_no(int i_no) {
		this.i_no = i_no;
	}
	public String getB_index() {
		return b_index;
	}
	public void setB_index(String b_index) {
		this.b_index = b_index;
	}
	public String getB_comment() {
		return b_comment;
	}
	public void setB_comment(String b_comment) {
		this.b_comment = b_comment;
	}
	public String getB_complain() {
		return b_complain;
	}
	public void setB_complain(String b_complain) {
		this.b_complain = b_complain;
	}
	public String getSeries_name() {
		return series_name;
	}
	public void setSeries_name(String series_name) {
		this.series_name = series_name;
	}
	public int getSeries_no() {
		return series_no;
	}
	public void setSeries_no(int series_no) {
		this.series_no = series_no;
	}
	public int getSeries_no_sub() {
		return series_no_sub;
	}
	public void setSeries_no_sub(int series_no_sub) {
		this.series_no_sub = series_no_sub;
	}
	public String getCat_name() {
		return cat_name;
	}
	public void setCat_name(String cat_name) {
		this.cat_name = cat_name;
	}
	
	
}
