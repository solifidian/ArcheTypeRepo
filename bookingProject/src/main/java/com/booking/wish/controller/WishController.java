package com.booking.wish.controller;



import java.util.List;

import javax.servlet.http.Cookie;
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
import com.booking.member.vo.MemberVO;
import com.booking.wish.service.WishService;
import com.booking.wish.vo.WishVO;



@Controller
@RequestMapping(value="/wish")
public class WishController {
	Logger logger=Logger.getLogger(WishController.class);
	@Autowired
	private WishService wishService;
	
	@Autowired
	private CartService cartService; 

	//위시리스트 호출
	
	@RequestMapping(value="/wishList.do",method=RequestMethod.GET)
	public String wishList(@ModelAttribute WishVO wvo , Model model, HttpServletRequest request, HttpSession session){
		logger.info("위시 리스트 호출"+wvo.getM_id());
		String m_id = "";
		
		Cookie[] cookies = request.getCookies();
		
		logger.info(cookies.length);
		
		for(Cookie cookie : cookies){
			logger.info(cookie.getName() + " = " + cookie.getValue());
		}
		
		MemberVO memSession = (MemberVO)session.getAttribute("memSession");
		
		if(memSession == null){
			logger.info("비회원");
			return "member/memberLoginPage";
		}else{
			 
			 m_id = memSession.getM_id();
		}
		
		
		logger.info("id = "+m_id);
		//id를 m_no 값으로 확인
		int no=wishService.searchM_no(m_id);
		logger.info("m_no="+no);
		wvo.setM_no(no);
		
		List<WishVO> list=wishService.wishList(wvo);
		
		model.addAttribute("wish" , list);
		
		
		return "wish/WishList";
	
	}
	
	//위시 리스트 삭제 
	@RequestMapping(value="wishDelete.do",method=RequestMethod.GET)
	@ResponseBody
	public String wishDelete(@ModelAttribute WishVO wvo){
		logger.info("위시 delete 호출");
		logger.info("위시 delete 입력값"+wvo.getM_id()+wvo.getIsbn());
		
		
		
		//위시 리스트에 같은 m_id로 m_no를 확인
		int no=wishService.searchM_no(wvo.getM_id());
		logger.info("m_no="+no);
		wvo.setM_no(no);
		
		String result="";
		int value=0;
		
		value=wishService.wishDelete(wvo);
		logger.info("delete value"+value);
		
		if(value==1){
			result="SUCCESS";
		}
		
		return result;
	}
	
	
	//위시 리스트 입력 /booking/wish/wishInsert.do
	@RequestMapping(value="wishInsert.do" , method=RequestMethod.POST)
	@ResponseBody
	public String wishInsert(@ModelAttribute WishVO wvo){
		
		logger.info("위시 리스트 입력 호출");
		logger.info("위시 리스트 입력값"+wvo.getM_id()+wvo.getIsbn());
		
		//위시 리스트에 같은 m_id로 m_no를 확인
		int no=wishService.searchM_no(wvo.getM_id());
		logger.info("m_no="+no);
		wvo.setM_no(no);
		
		
		String result="";
		int value=0;
	
	
	    //위시리스트에 같은 isbn번호가 있는지 체크
		int isbnvalue=wishService.isbnNumberCheck(wvo);
		logger.info("isbnvalue는"+isbnvalue);
			
			
		//같은 번호가 없을 경우 insert
		if(isbnvalue==0){	
				
		//같은 번호가 있을 경우 "이미 해당 책이 위시 리스트에 담겨져 있다"는 메시지를 위한 RETURN값 설정
							  
		value=wishService.wishInsert(wvo);
		logger.info("insert value"+value);
		}else if(isbnvalue==1){
		
		
		result="SAMEVALUE";
		}
	
	
		
	if(value==1){
		result="SUCCESS";
		
	}
		return result;
		
	}
	


}
