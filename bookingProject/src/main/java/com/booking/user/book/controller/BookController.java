package com.booking.user.book.controller;

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

import com.booking.admin.book.service.CategoryService;
import com.booking.book.vo.BookVO;
import com.booking.book.vo.CategoryVO;
import com.booking.common.paging.Paging;
import com.booking.user.book.service.BookService;

@Controller
@RequestMapping(value="/book")
public class BookController {
	Logger logger = Logger.getLogger(BookController.class);
		
	
	@Autowired
	private BookService bookService;
	
	@Autowired
	private CategoryService categoryService;
	
		
	@RequestMapping(value="/bookOrder.do")
	public String bookOrder(){
		return "book/bookOrder";
	}
	
	//외국도서 목록
	@RequestMapping(value="/bookForeign.do")
	public String bookForeign(){
		return "book/bookForeign";
	}
	
	//국내도서 목록
	@RequestMapping(value="/bookDomestic.do")
	public String bookDomestic(){
		return "book/bookDomestic";
	}
	
	
	//이달의 책
	@RequestMapping(value="/bookMonth.do")
	public String bookMonth(){
		return "book/bookMonth";
	}
	
	//베스트셀러
	@RequestMapping(value="/bookBestSeller.do")
	public String bookBestSeller(){
		return "book/bookBestSeller";
	}
	
	//신간
	@RequestMapping(value="/bookNew.do")
	public String bookNew(){
		return "book/bookNew";
	}
	
	
	//index페이지로 이동
	@RequestMapping(value="/bookIndex.do")
	public String bookIndex(@ModelAttribute CategoryVO ctvo, Model model){
		List<CategoryVO> ctvoList = categoryService.categoryBoxList(ctvo);
		
		model.addAttribute("cateList",ctvoList);
		return "book/bookIndex";
	}
	
	//에러404 페이지로 이동
	@RequestMapping(value="/errorPage.do")
	public String errorPage(){
		return "book/error";
	}
	
	//FAQ틀
	@RequestMapping(value="/bookFAQ.do")
	public String bookFAQ(){
		return "book/bookFAQ";
	}
	
	
	
	// 책 상세보기 페이지로
	@RequestMapping(value="/bookDetail.do", method=RequestMethod.GET)
	public String bookDetail(@RequestParam String isbn, Model model, HttpServletRequest request, HttpSession session){
		logger.info("BookDetail 호출 성공");
		logger.info("isbn = " + isbn);
		
		BookVO detail = new BookVO();
		detail = bookService.bookSelect(isbn);
		
		model.addAttribute("detail", detail);
		session.setAttribute("id", "test");
		
		return "book/bookDetail";
	}
	
	@RequestMapping(value="/bookSearch", method = RequestMethod.GET)
	public String bookList(@ModelAttribute BookVO bvo, Model model, HttpServletRequest request){
		logger.info("bookSearch Called");
		
		//listData default nvl
		if(bvo.getOrderDirection() == null){
			bvo.setOrderDirection("desc");
		}
		if(bvo.getOrderTarget() == null){
			bvo.setOrderTarget("b_update");
		}
		
		Paging.setBookPaging(bvo);
		
		List<BookVO> bookList = bookService.bookList(bvo);
		if(bookList != null)
		bvo.setSearchTotal(bookList.get(0).getSearchTotal());
		
		logger.info("searchTotal : "+bvo.getSearchTotal());
		logger.info("orderTarget : "+bvo.getOrderTarget());
		logger.info("orderDirection : "+bvo.getOrderDirection());
		
		model.addAttribute("bookList", bookList);
		model.addAttribute("listData", bvo);
		
		//siteLogService.siteLogUpdate(request, "bookList Move", "test");

		return "book/bookSearch";
	}
	
	@ResponseBody
	@RequestMapping(value="/bookSelect", method = RequestMethod.POST)
	public BookVO bookSelect(@RequestParam String isbn, Model model){
		logger.info("bookSelect Called");
		BookVO bvo = bookService.bookSelect(isbn);
		return bvo;
	}
	
	@ResponseBody
	@RequestMapping(value="/isbnCheck", method=RequestMethod.POST)
	public String isbnCheck(@RequestParam String isbn, Model model){
		logger.info("isbnCheck Called");
		
		String result = bookService.isbnCheck(isbn);
		
		return result;
	}
}

