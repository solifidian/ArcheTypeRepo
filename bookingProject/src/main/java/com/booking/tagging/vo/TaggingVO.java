package com.booking.tagging.vo;

import com.booking.book.vo.BookVO;

public class TaggingVO extends BookVO{
	private int tag_no;
	private String tag_name;
	private int tag_score;
	
	public int getTag_no() {
		return tag_no;
	}
	public void setTag_no(int tag_no) {
		this.tag_no = tag_no;
	}
	public String getTag_name() {
		return tag_name;
	}
	public void setTag_name(String tag_name) {
		this.tag_name = tag_name;
	}
	public int getTag_score() {
		return tag_score;
	}
	public void setTag_score(int tag_score) {
		this.tag_score = tag_score;
	}
	
	
}
