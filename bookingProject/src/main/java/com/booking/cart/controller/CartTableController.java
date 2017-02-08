package com.booking.cart.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.booking.cart.service.CartService;
import com.booking.cart.vo.CartVO;
import com.booking.common.util.Util;
import com.booking.member.vo.MemberVO;


@RestController
@RequestMapping(value="/carttable")
public class CartTableController {
	Logger logger=Logger.getLogger(CartTableController.class);
	@Autowired
	public CartService cartservice;
	
// 카트 리스트 호출	
	@RequestMapping(value="/cart.do",method=RequestMethod.GET)
	public ResponseEntity<List<CartVO>> list(@ModelAttribute CartVO cvo, HttpSession session,HttpServletRequest request){
	    logger.info("카트 리스트 호출");
		ResponseEntity<List<CartVO>> entity=null;
		  
		logger.info("책리스트 호출");
		
		
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
			
		}
		/*********** 세션 확인 종료 ***********/
		
		/* 쿠키로부터 JSESSIONID 가져오기
		 ***********************************/
		String cart_ip = "";
		cart_ip = Util.getCookieValue(request.getCookies(), "JSESSIONID");
		/************ 쿠기 가져오기 종료  ************/
		
		cvo.setM_no(m_no);
		cvo.setM_id(m_id);
		logger.info("m_id : "+cvo.getM_id());
		logger.info("m_no : "+cvo.getM_no());
		logger.info("cart_ip : "+cvo.getCart_ip());
		logger.info("isbn : "+cvo.getIsbn());
		
		
		
		try {
		  if(cvo.getIsbn().equals("")){	
			  
				logger.info("정상구매 호출");
				entity=new ResponseEntity<List<CartVO>>(cartservice.cartlist(cvo),HttpStatus.OK);
			  
		  }else{
			  logger.info("바로구매 호출");
		      entity=new ResponseEntity<List<CartVO>>(cartservice.nowpaycartlist(cvo),HttpStatus.OK);  
		    logger.info("바로구매"+entity);
		  }
			  
		  
			
		} catch (Exception e) {
			// TODO: handle exception
			entity=new ResponseEntity<List<CartVO>>(HttpStatus.BAD_REQUEST);
		}
		return entity; 
	}
	
	
//카트 책 아이템 삭제	
	@RequestMapping(value="/{isbn}.do",method=RequestMethod.POST)
	public ResponseEntity<String> cartTableBookDelete(@PathVariable("isbn") String isbn,@ModelAttribute CartVO cvo ,HttpSession session, HttpServletRequest request ){
		
		logger.info("카트 리스트 삭제 호출");
		logger.info("카트 리스트 삭제 호출"+isbn+cvo.getM_id()+cvo.getCart_ip()+cvo.getIsbn());
		ResponseEntity<String> entity=null;
		
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
			
		}
		/*********** 세션 확인 종료 ***********/
		
		/* 쿠키로부터 JSESSIONID 가져오기
		 ***********************************/
		String cart_ip = "";
		cart_ip = Util.getCookieValue(request.getCookies(), "JSESSIONID");
		/************ 쿠기 가져오기 종료  ************/
		
		cvo.setM_no(m_no);
		cvo.setM_id(m_id);
		cvo.setCart_ip(cart_ip);
		
		
		try {
			int result=cartservice.cartTableBookDelete(cvo);
			
			if(result==1){
			
			entity=new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			entity=new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity; 
	}
//카트 책 아이템 수량 업데이트 	/carttable/'+isbn+'.do

	@RequestMapping(value="/cartBookUpdate.do",method=RequestMethod.GET)
	public ResponseEntity<String> cartTableBookUpdate(@ModelAttribute CartVO cvo ,HttpSession session, HttpServletRequest request ){
		
		logger.info("카트 리스트 업데이트 호출");
		ResponseEntity<String> entity=null;
		logger.info("여기 호출 카트아이피"+cvo.getCart_ip()+"isbn"+cvo.getIsbn()+"cart_amount"+cvo.getCart_amount());
		
		
		

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
			
		}
		/*********** 세션 확인 종료 ***********/
		
		/* 쿠키로부터 JSESSIONID 가져오기
		 ***********************************/
		String cart_ip = "";
		cart_ip = Util.getCookieValue(request.getCookies(), "JSESSIONID");
		/************ 쿠기 가져오기 종료  ************/
		
		cvo.setM_no(m_no);
		cvo.setM_id(m_id);
		cvo.setCart_ip(cart_ip);
		
		
		
		
		try {
			
			int result = cartservice.cartTableBookUpdate(cvo);
			logger.info("리설트 값"+result);
			if(result==1){
				entity=new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
			
						} 
			}catch (Exception e) {
			// TODO: handle exception
			entity=new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
			
		return entity; 
	}	
}
