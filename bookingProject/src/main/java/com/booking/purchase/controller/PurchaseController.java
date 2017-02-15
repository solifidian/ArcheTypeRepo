package com.booking.purchase.controller;

import java.util.ArrayList;
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

import com.booking.admin.book.service.AdminBookService;
import com.booking.admin.book.vo.BookReleaseVO;
import com.booking.book.vo.BookVO;
import com.booking.book.vo.Purchase_relVO;
import com.booking.common.util.Util;
import com.booking.coupon.vo.CouponVO;
import com.booking.member.service.MemberService;
import com.booking.member.vo.MemberVO;
import com.booking.purchase.service.PurchaseService;
import com.booking.purchase.vo.PurchaseVO;

@Controller
@RequestMapping(value="/purchase")
public class PurchaseController {
	Logger logger=Logger.getLogger(PurchaseController.class);
	
	@Autowired
	public PurchaseService purchaseService;

	@Autowired
	private AdminBookService adminBookService;
	
	@Autowired
	private MemberService memberSerivce;
	
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
			public String purchaseUpdate(@ModelAttribute PurchaseVO pvo, Model model , HttpSession session){
				logger.info("회원 결제 완료 페이지 호출"+pvo.getNowpay());
			    logger.info(pvo.getM_id()+pvo.getM_phone()+pvo.getM_post_address()+pvo.getP_method()+pvo.getCookie_name()+pvo.getCoupon_code());
			  
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
					
					 pvo.setM_id(m_id);
					 pvo.setM_no(m_no);
				}
				/*********** 세션 확인 종료 ***********/
			    
			    
			    
			    int result=0;
			    int nowpay=pvo.getNowpay();//1=즉시구매 0=일반구매
			  //결제 완료 시 정보를 booking_purchase에 등록  
			    result=purchaseService.purchaseUpdate(pvo);
			    
			    
			    
			    System.out.println("받은 m_id"+m_id);
			    logger.info("discpont"+pvo.getP_discount());
			    PurchaseVO vo=pvo;
			    
			    if(result==1){
			    	//결제 완료 시 정보를 booking_purchase에 등록 성공 시 해당 카트에 있던 각 책의 정보를 저장  
			    	int bookpurchaserel=purchaseService.purchaseBookRel(pvo);
			    	logger.info(bookpurchaserel+"결제 정보  booking_purchase에 저장 0은 e등록안됨");
			    	
			    	/*************************************
			    	 *  출고 처리 구간
			    	 *  memberSerive의 purchaseDetail로 처리가 끝난 구매 기록을 읽어와 도서 출고 정황을 확인
			    	 *  일단 출고 된 것으로 보고 '구매로 인한 출고 예정'이라고 기록 되도록 한다 
			    	 ************************************/
			    	logger.info("release처리 1단계 p_no : "+pvo.getP_no());
			    	List<Purchase_relVO> purelList = memberSerivce.purchaseDetail(pvo.getP_no());
			    	logger.info("release처리 1단계 purelist.size() : "+purelList.size());
			    	//출고를 위한 VO
			    	List<BookReleaseVO> releaseList = new ArrayList<BookReleaseVO>();
			    	
			    	/************************************
			    	 * @St_name : 출고 설명
			    	 * @St_name_no: 각종 번호 기록용, 이 경우는 주문 번호가 기록 됨
			    	 * relaseList에 담아 각자 realse 테이블에 Inseet및 재고량 변경
			    	 **************************************/
			    	for(Purchase_relVO item : purelList){
			    		logger.info("release처리 2단계");
			    		BookReleaseVO rsvo = new BookReleaseVO();
			    		rsvo.setIsbn(item.getIsbn());
			    		rsvo.setRel_amount(item.getP_amount());
			    		rsvo.setRel_name("고객 구매로 인한 출고 예정");
			    		rsvo.setRel_name_no(item.getP_no());
			    		releaseList.add(rsvo);
			    	}
			    	/***********************************************
			    	* adminBookService의 bookReleaseInsert는
			    	* 처리 중에 자동으로 bookDB의 재고량 변경도 처리 해줌.
			    	* 추가적으로 service의 bookReleaseOut을 사용해 줄 필요 전혀 없음
			    	************************************************/
			    	for(BookReleaseVO item : releaseList){
			    		adminBookService.bookReleaseInsert(item);
			    	}
			    	/****************** 출고 처리 종료  *****************/
			    	
			     	//사용한 쿠폰 삭제
				     if(pvo.getP_discount()!=0 ){
				    	logger.info("discpont"+pvo.getP_discount());
				    	int couponResult=purchaseService.useCouponDelete(pvo);
				        logger.info(couponResult+"사용한 쿠폰 삭제 1은 삭제 0은 안삭제");
				     }
			    	
			    	
			    	//결제에 따른 포인트 지급 (결제금액의 1%) 회원만 포인트 지급
			    if(m_id!="0"){	
			    	int givePoint=purchaseService.givePoint(pvo);
			    	logger.info(givePoint+"결제에 따른 포인트 지급 1은 지급 0은 지급 실패");
			    			    	
			    }
			    if(nowpay==0){		
			    	//결제 완료 시 회원의 장바구니에 있던 모든 아이템 삭제 ( 바로구매의 경우 삭제 안함)
			    	int cartDelResult=purchaseService.cartAllDelete(pvo);
			    	logger.info(cartDelResult+"결제 완료 시 회원의 장바구니에 있던 모든 아이템 삭제  1은 삭제 0은 안삭제");	 
			    	
			   
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
