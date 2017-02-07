package com.booking.board.vo;


import com.booking.common.vo.ListCommonVO;

public class BoardVO extends ListCommonVO {

	private int bd_forum_no;		//게시판 번호
	private String bd_forum_name;	//게시판  이름
	private int bd_post_no;			//글번호
	private String bd_category;		//카테고리
	private String bd_head;			//말머리
	private String bd_title;		//글제목
	private String bd_writer;		//작성자
	private String bd_content;		//글내용
	private String bd_update;		//작성일
	private String bd_editdate;		//수정일	
	private String bd_pwd;			//비밀번호
	private String bd_status;		//비밀글
	private int bd_readcnt;			//조회수
	private int bd_score;			//추천수	
	private int bd_reindent;		//답글순서
	private int bd_restep;			//답글계층
	private int bd_reroot;			//상위글	
	private int bd_rcount;				//딸린댓글 갯수
	
	
	
	
	public int getBd_rcount() {
		return bd_rcount;
	}
	public void setBd_rcount(int bd_rcount) {
		this.bd_rcount = bd_rcount;
	}
	public int getBd_forum_no() {
		return bd_forum_no;
	}
	public void setBd_forum_no(int bd_forum_no) {
		this.bd_forum_no = bd_forum_no;
	}

	public String getBd_forum_name() {
		return bd_forum_name;
	}
	public void setBd_forum_name(String bd_forum_name) {
		this.bd_forum_name = bd_forum_name;
	}
	public String getBd_content() {
		return bd_content;
	}
	public void setBd_content(String bd_content) {
		this.bd_content = bd_content;
	}
	public int getBd_score() {
		return bd_score;
	}
	public void setBd_score(int bd_score) {
		this.bd_score = bd_score;
	}
	public int getBd_post_no() {
		return bd_post_no;
	}
	public void setBd_post_no(int bd_post_no) {
		this.bd_post_no = bd_post_no;
	}
	public String getBd_title() {
		return bd_title;
	}
	public void setBd_title(String bd_title) {
		this.bd_title = bd_title;
	}
	public String getBd_pwd() {
		return bd_pwd;
	}
	public void setBd_pwd(String bd_pwd) {
		this.bd_pwd = bd_pwd;
	}
	public String getBd_status() {
		return bd_status;
	}
	public void setBd_status(String bd_status) {
		this.bd_status = bd_status;
	}
	public String getBd_head() {
		return bd_head;
	}
	public void setBd_head(String bd_head) {
		this.bd_head = bd_head;
	}
	public String getBd_category() {
		return bd_category;
	}
	public void setBd_category(String bd_category) {
		this.bd_category = bd_category;
	}
	public int getBd_readcnt() {
		return bd_readcnt;
	}
	public void setBd_readcnt(int bd_readcnt) {
		this.bd_readcnt = bd_readcnt;
	}
	public int getBd_reindent() {
		return bd_reindent;
	}
	public void setBd_reindent(int bd_reindent) {
		this.bd_reindent = bd_reindent;
	}
	public int getBd_restep() {
		return bd_restep;
	}
	public void setBd_restep(int bd_restep) {
		this.bd_restep = bd_restep;
	}
	public int getBd_reroot() {
		return bd_reroot;
	}
	public void setBd_reroot(int bd_reroot) {
		this.bd_reroot = bd_reroot;
	}
	public String getBd_update() {
		return bd_update;
	}
	public void setBd_update(String bd_update) {
		this.bd_update = bd_update;
	}

	public String getBd_editdate() {
		return bd_editdate;
	}
	public void setBd_editdate(String bd_editdate) {
		this.bd_editdate = bd_editdate;
	}
	public String getBd_writer() {
		return bd_writer;
	}
	public void setBd_writer(String bd_writer) {
		this.bd_writer = bd_writer;
	}
	
	
	
}
