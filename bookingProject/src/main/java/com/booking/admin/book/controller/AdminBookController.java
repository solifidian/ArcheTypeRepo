package com.booking.admin.book.controller;

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
import com.booking.admin.book.vo.BookStockVO;
import com.booking.admin.sitelog.service.SiteLogService;
import com.booking.book.vo.BookVO;
import com.booking.common.paging.Paging;
import com.booking.member.vo.MemberVO;

@Controller
@RequestMapping(value="/admin/book")
public class AdminBookController {

	Logger logger = Logger.getLogger(AdminBookController.class);
	
	
	@Autowired
	private AdminBookService adminBookService;
	
	@Autowired
	private SiteLogService siteLogService;
	
	/*********** Book Controller ***********/
	
	@RequestMapping(value="/bookList", method = RequestMethod.GET)
	public String bookList(@ModelAttribute BookVO bvo, Model model, HttpServletRequest request){
		logger.info("bookList Called");
		
		/************* 관리자 계정아닐시 로그인 페이지로 던짐 시작***************/
		HttpSession session = request.getSession(false);
		if(session == null){
			return "redirect:/admin/member/adminLoginPage.do";
		}
		MemberVO memSession
		= (MemberVO)session.getAttribute("memSession");
		if(memSession == null){
			return "redirect:/admin/member/adminLoginPage.do";
		}
		else if(!memSession.getM_id().equals("admin")){
			return "redirect:/admin/member/adminLoginPage.do";
		}
		/************* 관리자 계정아닐시 로그인 페이지로 던짐 끝***************/
			
		//listData default nvl
		if(bvo.getOrderDirection() == null){
			bvo.setOrderDirection("desc");
		}
		if(bvo.getOrderTarget() == null){
			bvo.setOrderTarget("b_update");
		}
		
		Paging.setBookPaging(bvo);
		
		List<BookVO> bookList = adminBookService.bookList(bvo);
		if(bookList != null)
		bvo.setSearchTotal(bookList.get(0).getSearchTotal());
		
		logger.info("searchTotal : "+bvo.getSearchTotal());
		logger.info("orderTarget : "+bvo.getOrderTarget());
		logger.info("orderDirection : "+bvo.getOrderDirection());
		
		model.addAttribute("bookList", bookList);
		model.addAttribute("listData", bvo);
		
		//siteLogService.siteLogUpdate(request, "bookList Move", "test");

		return "admin/book/bookList";
	}
	
	@RequestMapping(value="/bookInfoList", method = RequestMethod.GET)
	public String bookInfoList(@ModelAttribute BookVO bvo, Model model, HttpServletRequest request){
		logger.info("bookInfoList Called");
		
		/************* 관리자 계정아닐시 로그인 페이지로 던짐 시작***************/
		HttpSession session = request.getSession(false);
		if(session == null){
			return "redirect:/admin/member/adminLoginPage.do";
		}
		MemberVO memSession
		= (MemberVO)session.getAttribute("memSession");
		if(memSession == null){
			return "redirect:/admin/member/adminLoginPage.do";
		}
		else if(!memSession.getM_id().equals("admin")){
			return "redirect:/admin/member/adminLoginPage.do";
		}
		/************* 관리자 계정아닐시 로그인 페이지로 던짐 끝***************/
		
		//listData default nvl
		if(bvo.getOrderDirection() == null){
			bvo.setOrderDirection("desc");
		}
		if(bvo.getOrderTarget() == null){
			bvo.setOrderTarget("b_update");
		}
		if(bvo.getPageSize() == null){
			bvo.setPageSize(5+"");
		}
		
		Paging.setBookPaging(bvo);
		
		List<BookVO> bookList = adminBookService.bookList(bvo);
		if(bookList != null)
		bvo.setSearchTotal(bookList.get(0).getSearchTotal());
		
	/*	logger.info("searchTotal : "+bvo.getSearchTotal());
		logger.info("orderTarget : "+bvo.getOrderTarget());
		logger.info("orderDirection : "+bvo.getOrderDirection());*/
		
		model.addAttribute("bookList", bookList);
		model.addAttribute("listData", bvo);
		
		//siteLogService.siteLogUpdate(request, "bookList Move", "test");

		return "admin/book/bookInfoList";
	}
	
	@RequestMapping(value="/tagTestPage", method = RequestMethod.GET)
	public String testPage(@ModelAttribute BookVO bvo, Model model, HttpServletRequest request){
		logger.info("bookInfoList Called");

		/************* 관리자 계정아닐시 로그인 페이지로 던짐 시작***************/
		HttpSession session = request.getSession(false);
		if(session == null){
			return "redirect:/admin/member/adminLoginPage.do";
		}
		MemberVO memSession
		= (MemberVO)session.getAttribute("memSession");
		if(memSession == null){
			return "redirect:/admin/member/adminLoginPage.do";
		}
		else if(!memSession.getM_id().equals("admin")){
			return "redirect:/admin/member/adminLoginPage.do";
		}
		/************* 관리자 계정아닐시 로그인 페이지로 던짐 끝***************/
		
		//listData default nvl
		if(bvo.getOrderDirection() == null){
			bvo.setOrderDirection("desc");
		}
		if(bvo.getOrderTarget() == null){
			bvo.setOrderTarget("b_update");
		}
		if(bvo.getPageSize() == null){
			bvo.setPageSize(5+"");
		}
		
		Paging.setBookPaging(bvo);
		
		List<BookVO> bookList = adminBookService.bookList(bvo);
		if(bookList != null)
		bvo.setSearchTotal(bookList.get(0).getSearchTotal());
		
	/*	logger.info("searchTotal : "+bvo.getSearchTotal());
		logger.info("orderTarget : "+bvo.getOrderTarget());
		logger.info("orderDirection : "+bvo.getOrderDirection());*/
		
		model.addAttribute("bookList", bookList);
		model.addAttribute("listData", bvo);
		
		//siteLogService.siteLogUpdate(request, "bookList Move", "test");

		return "admin/book/taggingTestPage";
	}
	
	@ResponseBody
	@RequestMapping(value="/bookSelect", method = RequestMethod.POST)
	public BookVO bookSelect(@RequestParam String isbn, Model model){
		logger.info("bookSelect Called");
		BookVO bvo = adminBookService.bookSelect(isbn);
		return bvo;
	}
	
	@ResponseBody
	@RequestMapping(value="/isbnCheck", method=RequestMethod.POST)
	public String isbnCheck(@RequestParam String isbn, Model model){
		logger.info("isbnCheck Called");
		
		String result = adminBookService.isbnCheck(isbn);
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/bookInsert", method=RequestMethod.POST)
	public String bookInsert(@ModelAttribute BookVO bvo, Model model, HttpServletRequest request){
		String resultStr = "FAILED";
		int result = adminBookService.bookInsert(bvo);
		
		if(result == 1){
			resultStr = "SUCCESS";
		}
		
		return resultStr;
	}
	
	@ResponseBody
	@RequestMapping(value="/bookUpdate", method=RequestMethod.POST)
	public String bookUpdate(@ModelAttribute BookVO bvo, Model model, HttpServletRequest request){
		String resultStr = "FAILED";
		int result = adminBookService.bookUpdate(bvo);
		
		if(result == 1){
			resultStr = "SUCCESS";
		}
		
		return resultStr;
	}
	/*********** BookStock Controller ***********/
	
	@RequestMapping(value="/bookStockList", method = RequestMethod.GET)
	public String bookStockList(@ModelAttribute BookStockVO bsvo, Model model, HttpServletRequest request){
		logger.info("bookStockList Called");
		
		/************* 관리자 계정아닐시 로그인 페이지로 던짐 시작***************/
		HttpSession session = request.getSession(false);
		if(session == null){
			return "redirect:/admin/member/adminLoginPage.do";
		}
		MemberVO memSession
		= (MemberVO)session.getAttribute("memSession");
		if(memSession == null){
			return "redirect:/admin/member/adminLoginPage.do";
		}
		else if(!memSession.getM_id().equals("admin")){
			return "redirect:/admin/member/adminLoginPage.do";
		}
		/************* 관리자 계정아닐시 로그인 페이지로 던짐 끝***************/
		
		//listData default nvl
		if(bsvo.getOrderDirection() == null){
			bsvo.setOrderDirection("desc");
		}
		if(bsvo.getOrderTarget() == null){
			bsvo.setOrderTarget("st_date");
		}
		
		Paging.setBookPaging(bsvo);
		
		List<BookStockVO> bookStockList = adminBookService.bookStockList(bsvo);
		if(bookStockList.size() > 0){
			bsvo.setSearchTotal(bookStockList.get(0).getSearchTotal());
		}

		logger.info("searchTotal : "+bsvo.getSearchTotal());
		logger.info("orderTarget : "+bsvo.getOrderTarget());
		logger.info("orderDirection : "+bsvo.getOrderDirection());
		
		model.addAttribute("stockList", bookStockList);
		model.addAttribute("listData", bsvo);
		
		//siteLogService.siteLogUpdate(request, "bookStockList Move", "test");

		return "admin/book/bookStockList";
	}
	
	@RequestMapping(value="/bookStockInsert", method=RequestMethod.POST)
	public String bookStockInsert(@ModelAttribute BookStockVO bsvo, Model model, HttpServletRequest request){
		logger.info("bookStockInsert Called");
		logger.info("st_name = "+ bsvo.getSt_name());
		String resultData = "";
		String resultMessage = "";
		String redirectURL = "/admin/book/bookStockList.do";
		
		int success = adminBookService.bookStockInsert(bsvo);
		if(success == 1){
			resultData = "SUCCESS";
			resultMessage = "등록에 성공했습니다";
		}
		else{
			resultData = "FAILED";
			resultMessage = "등록에 실패했습니다";
		}
		
		model.addAttribute("resultData", resultData);
		model.addAttribute("resultMessage", resultMessage);
		model.addAttribute("redirectURL", redirectURL);
		
		//siteLogService.siteLogUpdate(request, "bookStockInsert Test", "ISBN:"+bsvo.getIsbn());
		
		return "common/resultPage";
	}
	
	/*********** bookRelase Controller ***********/
	
	@RequestMapping(value="/bookReleaseList", method = RequestMethod.GET)
	public String bookReleaseList(@ModelAttribute BookReleaseVO brvo, Model model, HttpServletRequest request){
		logger.info("bookReleaseList Called");
		
		/************* 관리자 계정아닐시 로그인 페이지로 던짐 시작***************/
		HttpSession session = request.getSession(false);
		if(session == null){
			return "redirect:/admin/member/adminLoginPage.do";
		}
		MemberVO memSession
		= (MemberVO)session.getAttribute("memSession");
		if(memSession == null){
			return "redirect:/admin/member/adminLoginPage.do";
		}
		else if(!memSession.getM_id().equals("admin")){
			return "redirect:/admin/member/adminLoginPage.do";
		}
		/************* 관리자 계정아닐시 로그인 페이지로 던짐 끝***************/
		//listData default nvl
		if(brvo.getOrderDirection() == null){
			brvo.setOrderDirection("desc");
		}
		if(brvo.getOrderTarget() == null){
			brvo.setOrderTarget("rel_date");
		}
		
		Paging.setBookPaging(brvo);
		
		List<BookReleaseVO> bookReleaseList = adminBookService.bookReleaseList(brvo);
		if(bookReleaseList.size() > 0){
			brvo.setSearchTotal(bookReleaseList.get(0).getSearchTotal());
		}
		logger.info("searchTotal : "+brvo.getSearchTotal());
		logger.info("orderTarget : "+brvo.getOrderTarget());
		logger.info("orderDirection : "+brvo.getOrderDirection());
		
		model.addAttribute("releaseList", bookReleaseList);
		model.addAttribute("listData", brvo);
		
		//siteLogService.siteLogUpdate(request, "bookReleaseList Move", "test");

		return "admin/book/bookReleaseList";
	}
	
	@RequestMapping(value="/bookReleaseInsert", method=RequestMethod.POST)
	public String bookReleaseInsert(@ModelAttribute BookReleaseVO brvo, Model model){
		logger.info("bookReleaseInsert Called");
		
		String resultData = "";
		String resultMessage = "";
		String redirectURL = "/admin/book/bookReleaseList.do";
		
		int success = adminBookService.bookReleaseInsert(brvo);
		if(success == 1){
			resultData = "SUCCESS";
			resultMessage = "등록에 성공했습니다";
		}
		else{
			resultData = "FAILED";
			resultMessage = "등록에 실패했습니다";
		}
		
		model.addAttribute("resultData", resultData);
		model.addAttribute("resultMessage", resultMessage);
		model.addAttribute("redirectURL", redirectURL);
		model.addAttribute("redirectURL", redirectURL);
		
		return "common/resultPage";
	}
}
