package com.booking.cart.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.booking.cart.service.CartService;
import com.booking.cart.vo.CartVO;
import com.booking.common.util.Util;
import com.booking.member.vo.MemberVO;


@Controller
@RequestMapping(value="/cart")
public class CartController {
	Logger logger=Logger.getLogger(CartController.class);
	@Autowired
	public CartService cartservice;
	
	
	
	//장바구니 페이지 호출
	@RequestMapping(value="/cartlist.do")
	public String cartlist(@ModelAttribute CartVO cvo,Model model, HttpSession session ) {
		logger.info("장바구니 페이지 호출");
		logger.info(cvo.getM_id());
		
			
		return "cart/CartList";
	}
	
	
	//카트 insert 호출
	@ResponseBody
	@RequestMapping(value="/cartInsert.do" , method=RequestMethod.POST)
	public String cartInsert(@ModelAttribute CartVO cvo,Model model, HttpServletRequest request, HttpSession session) {
		logger.info("cartInsert 호출 성공");
		logger.info("isbn  : "+cvo.getIsbn());	
		
	/*	//책 insert프로세스 
			1. isbn번호와 user id, cart_amount를 입력 받는다.
			2. user id를 조회하여 user_no를 검색한다.
			3. user id가 없을 경우 (비회원) 쿠키를 생성하여 cart_ip에 입력한다. 
			     쿠키의 생성시간은 24시간 
			
			*etc )
			*만약 같은 값의 isbn이 이미 장바구니에  있을 경우 insert가 아닌 수량을 update해준다. 
			*/
		
		//logger.info("searchlist 호출//"+cvo.getM_id()+"//"+cvo.getCart_amount()+"isbn"+cvo.getIsbn()+"//"+cvo.getCart_ip());
		
		/**********************************
		 * 세션 확인
		 * memSession is not null = 회원
		 *********************************/
		String m_id = "";
		int m_no = 0;
		MemberVO memSession = (MemberVO)session.getAttribute("memSession");
		
		if(memSession != null && !memSession.getM_id().equals("")){
			logger.info("회원 확인 됨");
			m_id = memSession.getM_id();			
			m_no = memSession.getM_no();
			logger.info("m_no 호출"+memSession.getM_no());
		}
		/*********** 세션 확인 종료 ***********/
		
		/************************************
		 * 쿠키로부터 JSESSIONID 가져오기
		 ***********************************/
		String cart_ip = "";
		cart_ip = Util.getCookieValue(request.getCookies(), "JSESSIONID");
		/************ 쿠기 가져오기 종료  ************/
		
		
		cvo.setCart_ip(cart_ip);
		
		logger.info("cart_ip = "+cart_ip);
		int value =0;
		String result="";
		String isbn = cvo.getIsbn();
		cvo.setM_no(m_no);
		cvo.setM_id(m_id);
		//장바구니에 같은 isbn번호가 있는지 체크
		int isbnvalue=cartservice.isbnNumberCheck(cvo);
		//logger.info("isbnvalue는"+isbnvalue);
		//logger.info("입력 amount는"+cvo.getCart_amount());
		
		//같은 번호가 없을 경우 insert
		logger.info("입력 isbn : "+cvo.getIsbn());
		if(isbnvalue==0){
		  value=cartservice.cartInsert(cvo);
		  logger.info("insert value : "+value);
		//같은 번호가 있을 경우 수량 update
		}
		else if(isbnvalue==1){
		  value=cartservice.cartUpdate(cvo);
		  logger.info("update value : "+value);
		}
		  
		//insert 및 update가 성공(1)일 경우 return 값은 "success"
		if(value==1){
		result="SUCCESS";
		}
		
		return result;
	}
	
	

	
	
	
	
	
}
