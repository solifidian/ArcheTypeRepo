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
import com.booking.common.util.Util;
import com.booking.coupon.service.CouponService;
import com.booking.coupon.vo.CouponVO;
import com.booking.member.vo.MemberVO;

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
	
		
	   String result="";
	   
	   
	   /**********************************
		 * 세션 확인
		 * memSession is not null = 회원
		 *********************************/
		String m_id = "0";
		int m_no = 0;
		MemberVO memSession = (MemberVO)session.getAttribute("memSession");
		
		if(memSession != null && !memSession.getM_id().equals("")){
			logger.info("회원 확인 됨");
			m_id = memSession.getM_id();
			
			m_no = memSession.getM_no();
			logger.info("회원 확인 됨"+m_id+m_no);
		}
		/*********** 세션 확인 종료 ***********/
		
		cvo.setM_id(m_id);
		cvo.setM_no(m_no);
	   
	   
		if(memSession == null || memSession.equals("")){
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
