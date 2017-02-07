package com.booking.reply.vo;

public class ReplyVO {
	private int 	re_no 		= 0;			//리플번호
	private String 	re_writer	= "";			//작성자
	private String	re_update	= "";			//작성일
	private String	re_content	= "";			//내용
	private String 	re_pwd		= "";			//비밀번호
	private int 	bd_forum_no = 0;			//게시판 번호
	private int 	bd_post_no 	= 0;			//글번호
	private String 	re_update_time = "";		//댓글 작성 시간
	
	
	
	
	public String getRe_update_time() {
		return re_update_time;
	}
	public void setRe_update_time(String re_update_time) {
		this.re_update_time = re_update_time;
	}
	public int getRe_no() {
		return re_no;
	}
	public void setRe_no(int re_no) {
		this.re_no = re_no;
	}
	public String getRe_writer() {
		return re_writer;
	}
	public void setRe_writer(String re_writer) {
		this.re_writer = re_writer;
	}
	public String getRe_update() {
		return re_update;
	}
	public void setRe_update(String re_update) {
		this.re_update = re_update;
	}
	public String getRe_content() {
		return re_content;
	}
	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}
	public String getRe_pwd() {
		return re_pwd;
	}
	public void setRe_pwd(String re_pwd) {
		this.re_pwd = re_pwd;
	}
	public int getBd_forum_no() {
		return bd_forum_no;
	}
	public void setBd_forum_no(int bd_forum_no) {
		this.bd_forum_no = bd_forum_no;
	}
	public int getBd_post_no() {
		return bd_post_no;
	}
	public void setBd_post_no(int bd_post_no) {
		this.bd_post_no = bd_post_no;
	}
	
	
}
