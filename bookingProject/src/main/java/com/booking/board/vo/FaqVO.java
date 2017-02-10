package com.booking.board.vo;


import com.booking.common.vo.ListCommonVO;

public class FaqVO extends ListCommonVO {
	private int fnq_no;						//게시글 번호
	private String fnq_title="";			//게시글 제목
	private String fnq_content="";			//게시글 내용
	private String fnq_reply_content="";
	private String fnq_update="";
	private String fnq_editdate="";
	private String fnq_category="";
	private String fnq_writer="";			//게시글 글쓴이
	public int getFnq_no() {
		return fnq_no;
	}
	public void setFnq_no(int fnq_no) {
		this.fnq_no = fnq_no;
	}
	public String getFnq_title() {
		return fnq_title;
	}
	public void setFnq_title(String fnq_title) {
		this.fnq_title = fnq_title;
	}
	public String getFnq_content() {
		return fnq_content;
	}
	public void setFnq_content(String fnq_content) {
		this.fnq_content = fnq_content;
	}
	public String getFnq_reply_content() {
		return fnq_reply_content;
	}
	public void setFnq_reply_content(String fnq_reply_content) {
		this.fnq_reply_content = fnq_reply_content;
	}
	public String getFnq_update() {
		return fnq_update;
	}
	public void setFnq_update(String fnq_update) {
		this.fnq_update = fnq_update;
	}
	public String getFnq_editdate() {
		return fnq_editdate;
	}
	public void setFnq_editdate(String fnq_editdate) {
		this.fnq_editdate = fnq_editdate;
	}
	public String getFnq_category() {
		return fnq_category;
	}
	public void setFnq_category(String fnq_category) {
		this.fnq_category = fnq_category;
	}
	public String getFnq_writer() {
		return fnq_writer;
	}
	public void setFnq_writer(String fnq_writer) {
		this.fnq_writer = fnq_writer;
	}
	
	
	
}
