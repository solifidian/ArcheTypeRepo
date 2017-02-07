package com.booking.purchase.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		public String purchaseList(@ModelAttribute PurchaseVO pvo , Model model){
			logger.info("회원 구매 페이지 호출");
			logger.info("나우페이"+pvo.getNowpay()+"//"+pvo.getIsbn()+"//");
		
			 //즉시구매 값이 1일 경우 값을 호출함 
		      if(pvo.getNowpay()==1){
		    	  PurchaseVO vo=purchaseService.nowPay(pvo.getIsbn());
		    	  model.addAttribute("data",vo);
		    	  model.addAttribute("pay",pvo.getNowpay());
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
		    	//결제 완료 시 정보를 booking_purchase에 등록 성공 시 해당 카트에 있던 정보를 삭제  
		    	int bookpurchaserel=purchaseService.purchaseBookRel(pvo);
		    	logger.info("bookpurchaserel:"+bookpurchaserel);		    	
		    	
		    if(nowpay==0){		
		    	int cartDelResult=purchaseService.cartAllDelete(pvo);
		    	logger.info("cartDelResult: " + cartDelResult);	 
		    
		    	if(cartDelResult!=0){
		    		  System.out.println("삭제 성공");
		    		  
		    		  
		    				    		  
		    	  		 }
		    	    
		           }
		  
		        //결제 완료 페이지에 뿌려줄 데이터
		          model.addAttribute("data",vo);
  		  		  logger.info("가격"+pvo.getP_totprice());
		    }    
		    
		    
		    
		    return "purchase/purchaseUpdate";
		}
		
	
	
	
}
