package com.booking.purchase.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.booking.common.util.Util;
import com.booking.coupon.vo.CouponVO;
import com.booking.member.vo.MemberVO;
import com.booking.purchase.service.PurchaseService;
import com.booking.purchase.vo.PurchaseVO;

@Controller
@RequestMapping(value="/purchase")
public class PurchaseController {
	Logger logger=Logger.getLogger(PurchaseController.class);
	
	@Autowired
	public PurchaseService purchaseService;

	
	//회원 주문 페이지 호출
			@RequestMapping(value="/purchaseList.do" )
			public String purchaseList(@ModelAttribute PurchaseVO pvo , Model model,HttpSession session, HttpServletRequest request){
				logger.info("회원 구매 페이지 호출");
				logger.info("나우페이"+pvo.getNowpay()+"//"+pvo.getIsbn()+"//"+pvo.getM_id()+pvo.getCookie_name());
			    
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
				
				/************************************
				 * 쿠키로부터 JSESSIONID 가져오기
				 ***********************************/
				String cart_ip = "";
				cart_ip = Util.getCookieValue(request.getCookies(), "JSESSIONID");
				/************ 쿠기 가져오기 종료  ************/
							
				pvo.setCookie_name(cart_ip);
				pvo.setM_id(m_id);
				pvo.setM_no(m_no);
				
				
				 List<CouponVO> cvo=purchaseService.couponList(pvo);
			     model.addAttribute("coupon",cvo);
				
				 //즉시구매 값이 1일 경우 호출함 
			      if(pvo.getNowpay()==1){
			    	  PurchaseVO vo=purchaseService.nowPay(pvo.getIsbn());
			    	  model.addAttribute("data",vo);
			    	  model.addAttribute("pay",pvo.getNowpay());
			    	  model.addAttribute("coupon",cvo);
			    	  logger.info("즉시구매호출성공9");
			      }
				
				
					return "purchase/purchaseList";
			}
			
		
		@ResponseBody
		@RequestMapping(value="/purchaseDetail.do", method=RequestMethod.POST)
		public List<PurchaseVO> purchaseDetail(@RequestParam int p_no){
			List<PurchaseVO> detailList = null;
			
			detailList = purchaseService.purchaseDetail(p_no);
			
			return detailList;
		}
		
		
	
		
		
		//결제 완료 시 정보를 booking_purchase에 등록  
			@RequestMapping(value="/purchaseUpdate.do" , method=RequestMethod.POST)
			public String purchaseUpdate(@ModelAttribute PurchaseVO pvo, Model model){
				logger.info("회원 결제 완료 페이지 호출"+pvo.getNowpay());
			    logger.info(pvo.getM_id()+pvo.getM_phone()+pvo.getM_post_address()+pvo.getP_method()+pvo.getCookie_name()+pvo.getCoupon_code());
			    int result=0;
			    int nowpay=pvo.getNowpay();//1=즉시구매 0=일반구매
			  //결제 완료 시 정보를 booking_purchase에 등록  
			    result=purchaseService.purchaseUpdate(pvo);
			    String m_id=pvo.getM_id();
			    System.out.println("받은 m_id"+m_id);
			    
			    PurchaseVO vo=pvo;
			    
			    if(result==1){
			    	//결제 완료 시 정보를 booking_purchase에 등록 성공 시 해당 카트에 있던 각 책의 정보를 저장  
			    	int bookpurchaserel=purchaseService.purchaseBookRel(pvo);
			    	logger.info(bookpurchaserel+" 0은 e등록안됨");
			    	
			    	//결제에 따른 포인트 지급 (결제금액의 1%) 회원만 포인트 지급
			    if(m_id!="0"){	
			    	int givePoint=purchaseService.givePoint(pvo);
			    	logger.info(givePoint+"1은 지급 0은 지급 실패");
			    			    	
			    }
			    if(nowpay==0){		
			    	//결제 완료 시 회원의 장바구니에 있던 모든 아이템 삭제 ( 바로구매의 경우 삭제 안함)
			    	int cartDelResult=purchaseService.cartAllDelete(pvo);
			    	logger.info(cartDelResult+"1은 삭제 0은 안삭제");	 
			    
			    	if(cartDelResult!=0){
			    		logger.info("결제 완료");	 
			    		  
			    		  
			    				    		  
			    	  		 }
			    	    
			           }
			         
			        //결제 완료 페이지에 뿌려줄 데이터
			       String price=Util.priceNumber(pvo.getP_totprice());
			        
			          model.addAttribute("data",vo);
			          model.addAttribute("price",price);
	  		  		  logger.info("가격"+pvo.getP_totprice());
			    }    
			    
			    
			    
			    return "purchase/purchaseUpdate";
			}
			
	
	
	
}
