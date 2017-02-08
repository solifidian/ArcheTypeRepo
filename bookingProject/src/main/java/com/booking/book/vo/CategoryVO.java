package com.booking.book.vo;

public class CategoryVO {

	private int cat_no; // 분류 번호
	
	private String cat_name; // 분류명
	
	private int cat_root; // 상위 분류 번호
	
	private int cat_step; // 분류 계층
	
	private String hc;
	private int hc_no;
	
	private String mc;
	private int mc_no;
	
	private String lc;
	private int lc_no;
	
	private String lc2;
	private int lc2_no;
	
	
	public int getCat_no() {
		return cat_no;
	}
	public void setCat_no(int cat_no) {
		this.cat_no = cat_no;
	}
	public String getCat_name() {
		return cat_name;
	}
	public void setCat_name(String cat_name) {
		this.cat_name = cat_name;
	}
	public int getCat_root() {
		return cat_root;
	}
	public void setCat_root(int cat_root) {
		this.cat_root = cat_root;
	}
	public int getCat_step() {
		return cat_step;
	}
	public void setCat_step(int cat_step) {
		this.cat_step = cat_step;
	}
	public String getHc() {
		return hc;
	}
	public void setHc(String hc) {
		this.hc = hc;
	}
	public int getHc_no() {
		return hc_no;
	}
	public void setHc_no(int hc_no) {
		this.hc_no = hc_no;
	}
	public String getMc() {
		return mc;
	}
	public void setMc(String mc) {
		this.mc = mc;
	}
	public int getMc_no() {
		return mc_no;
	}
	public void setMc_no(int mc_no) {
		this.mc_no = mc_no;
	}
	public String getLc() {
		return lc;
	}
	public void setLc(String lc) {
		this.lc = lc;
	}
	public int getLc_no() {
		return lc_no;
	}
	public void setLc_no(int lc_no) {
		this.lc_no = lc_no;
	}
	public String getLc2() {
		return lc2;
	}
	public void setLc2(String lc2) {
		this.lc2 = lc2;
	}
	public int getLc_no2() {
		return lc2_no;
	}
	public void setLc_no2(int lc_no2) {
		this.lc2_no = lc_no2;
	}

	
	
	
}
