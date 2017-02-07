package com.booking.admin.sitelog.vo;

import com.booking.common.vo.ListCommonVO;

public class SiteLogVO extends ListCommonVO{
	private int log_no;
	private String log_ip;
	private String log_update;
	private String log_title;
	private String log_comment;
	
	
	public int getLog_no() {
		return log_no;
	}
	public void setLog_no(int log_no) {
		this.log_no = log_no;
	}
	public String getLog_ip() {
		return log_ip;
	}
	public void setLog_ip(String log_ip) {
		this.log_ip = log_ip;
	}
	public String getLog_update() {
		return log_update;
	}
	public void setLog_update(String log_update) {
		this.log_update = log_update;
	}
	public String getLog_title() {
		return log_title;
	}
	public void setLog_title(String log_title) {
		this.log_title = log_title;
	}
	public String getLog_comment() {
		return log_comment;
	}
	public void setLog_comment(String log_comment) {
		this.log_comment = log_comment;
	}
	
	
}
