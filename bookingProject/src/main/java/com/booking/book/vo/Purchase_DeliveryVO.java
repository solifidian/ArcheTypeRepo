package com.booking.book.vo;

public class Purchase_DeliveryVO  extends PurchaseVO {
	private String del_company_name;    //배송사명
	private int m_no;
	private String m_id;
	private int p_no;                   //주문번호
	private String del_ondate;          //도착예정일
	private String del_num;             //배송번호
	private String del_site;            //바송사
	private String del_status;          //배송상태
	private String del_company_phone;   //배송사전화
	private String pur_del_mode; // 주문내역 / 배송내역 구분
	
	
	
	public String getDel_company_name() {
		return del_company_name;
	}
	public void setDel_company_name(String del_company_name) {
		this.del_company_name = del_company_name;
	}
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	public String getDel_ondate() {
		return del_ondate;
	}
	public void setDel_ondate(String del_ondate) {
		this.del_ondate = del_ondate;
	}
	public String getDel_num() {
		return del_num;
	}
	public void setDel_num(String del_num) {
		this.del_num = del_num;
	}
	public String getDel_site() {
		return del_site;
	}
	public void setDel_site(String del_site) {
		this.del_site = del_site;
	}
	public String getDel_status() {
		return del_status;
	}
	public void setDel_status(String del_status) {
		this.del_status = del_status;
	}
	public String getDel_company_phone() {
		return del_company_phone;
	}
	public void setDel_company_phone(String del_company_phone) {
		this.del_company_phone = del_company_phone;
	}
	public String getPur_del_mode() {
		return pur_del_mode;
	}
	public void setPur_del_mode(String pur_del_mode) {
		this.pur_del_mode = pur_del_mode;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	
	
	
	
}
