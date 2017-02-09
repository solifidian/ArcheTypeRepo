package com.booking.search.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.Response;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.booking.common.util.Util;
import com.booking.search.service.SearchService;
import com.booking.search.vo.SearchVO;



@Controller
@RequestMapping(value="/search")
public class SearchController {
	Logger logger = Logger.getLogger(this.getClass());
	@Autowired
	public SearchService searchService; 
	
	
	
	@RequestMapping(value="/search.do")
	public String booksearchlist(@ModelAttribute SearchVO svo,Model model, HttpSession session,  HttpServletResponse response ){
		logger.info("searchlist 호출");
		
			
		List<SearchVO> list=searchService.booksearchlist(svo);
		   //결제 완료 페이지에 뿌려줄 데이터
	   
		
	     model.addAttribute("data" , list);
		 
				
		
		
		return "search/searchpage";
	}
	
	
	
	
	/*@RequestMapping(value="/searchdetail.do",method=RequestMethod.GET)
	public String booksearchdetail(@ModelAttribute SearchVO svo, Model model) {
		
		logger.info("searchdetail 호출");
		SearchVO vo=null;
		vo=searchService.booksearchdetail(svo);
		model.addAttribute("data",vo);
		
		return "booking/searchdetailpage";
		
	}*/
	
}
