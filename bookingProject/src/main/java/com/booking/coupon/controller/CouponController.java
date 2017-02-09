package com.booking.coupon.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.HttpJspPage;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.booking.cart.controller.CartController;
import com.booking.coupon.service.CouponService;
import com.booking.coupon.vo.CouponVO;

@Controller
@RequestMapping(value="/coupon")
public class CouponController {
	Logger logger=Logger.getLogger(CartController.class);
	
	@Autowired
	public CouponService couponService;
	
	@RequestMapping(value="/coupon_pop.do")
	public String coupon_pop(@ModelAttribute CouponVO cvo , Model model){
		
		
		
		
		return "coupon/coupon";
	}
	
	
	
	
	@ResponseBody
	@RequestMapping(value="/couponInsert.do")
	public String couponInsert(@ModelAttribute CouponVO cvo,HttpSession session, HttpServletRequest request ){
		logger.info("쿠폰등록");
		logger.info("mno"+cvo.getM_no());
		
		cvo.setM_no(51);
		cvo.setCoupon_no(2);
	   session = request.getSession();
	   String result="";
	   
	   
		if(session.getAttribute("id") == null || session.getAttribute("id").equals("")){
			logger.info("NoMember nocouponuse");
			result = "fail";
			
		}else{
			//Need Id Chk
			logger.info("YesMember");
			//같은 쿠폰이 있을 경우 체크하는 
			int samecouponchk=couponService.couponCheck(cvo);
			logger.info("쿠폰값 1/0"+samecouponchk);
			if(samecouponchk==1){
				
				result = "miss";
			
			}else if(samecouponchk==0){
				
				//쿠폰입력
				int couponresult=couponService.couponInsert(cvo);
				result = "success";	
			}
			
		
			
		}

		
		
		return result;
		
	}
	

}
