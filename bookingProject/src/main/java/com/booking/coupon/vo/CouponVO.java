package com.booking.coupon.vo;

import com.booking.member.vo.MemberVO;

public class CouponVO extends MemberVO {

		private int coupon_no=0;
		private String coupon_name="";
		private double coupon_discount_ratio=0f;
		private String coupon_code="";
		
		private String eventgo="";
		
		
		public String getEventgo() {
			return eventgo;
		}
		public void setEventgo(String eventgo) {
			this.eventgo = eventgo;
		}
		
		public int getCoupon_no() {
			return coupon_no;
		}
		public void setCoupon_no(int coupon_no) {
			this.coupon_no = coupon_no;
		}
		public String getCoupon_name() {
			return coupon_name;
		}
		public void setCoupon_name(String coupon_name) {
			this.coupon_name = coupon_name;
		}
		public double getCoupon_discount_ratio() {
			return coupon_discount_ratio;
		}
		public void setCoupon_discount_ratio(double coupon_discount_ratio) {
			this.coupon_discount_ratio = coupon_discount_ratio;
		}
		public String getCoupon_code() {
			return coupon_code;
		}
		public void setCoupon_code(String coupon_code) {
			this.coupon_code = coupon_code;
		}
		
		
	
}
