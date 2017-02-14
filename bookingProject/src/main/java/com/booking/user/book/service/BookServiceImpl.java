package com.booking.user.book.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.booking.admin.book.service.CategoryService;
import com.booking.book.vo.BookVO;
import com.booking.user.book.dao.BookDAO;

@Service
@Transactional
public class BookServiceImpl implements BookService {
	Logger logger = Logger.getLogger(BookServiceImpl.class);
	
	@Autowired
	private BookDAO bookDAO;
	
	@Autowired
	private CategoryService categoryService;
	
	
	//글 디테일
	@Override
	public BookVO bookDetail(BookVO bvo){
		BookVO detail = null;
		detail = bookDAO.bookDetail(bvo);
		
		return detail;
	}
	
	@Override
	public List<BookVO> bookList(BookVO bvo){
		List<BookVO> bookList = bookDAO.bookList(bvo);
		if(bookList.size() > 0){
			bookList.get(0).setSearchTotal(bookDAO.bookSearchTotal(bvo));
			for(BookVO item : bookList){
				item.setCat_name(categoryService.categoryLongName(item));
			}
		}
		
		return bookList;
	}
	
	@Override
	public int bookSearchTotal(BookVO bvo){
		return bookDAO.bookSearchTotal(bvo);
	}
	@Override
	public String isbnCheck(String isbn){
		return bookDAO.isbnCheck(isbn);
	}
	@Override
	public BookVO bookSelect(String isbn){
		return bookDAO.bookSelect(isbn);
	}

	@Override
	public List<BookVO> etcListCall() {
		// TODO Auto-generated method stub
		List<BookVO> bookList =bookDAO.etcListCall();
		
		return bookList;
	}

	@Override
	public List<BookVO> list1() {
		// TODO Auto-generated method stub
		List<BookVO> list1 =bookDAO.list1();
		return list1;
	}

	@Override
	public List<BookVO> list2() {
		// TODO Auto-generated method stub
		List<BookVO> list2 =bookDAO.list2();
		return list2;
	}

	@Override
	public List<BookVO> list3() {
		// TODO Auto-generated method stub
		List<BookVO> list3 =bookDAO.list3();
		return list3;
	}

	@Override
	public List<BookVO> list4() {
		// TODO Auto-generated method stub

		List<BookVO> list4 =bookDAO.list4();
		return list4;
		
	}

	@Override
	public List<BookVO> list5() {
		// TODO Auto-generated method stub
		List<BookVO> list5 =bookDAO.list5();
		return list5;
	}
	
	@Override
	public List<BookVO> randomList() {
		// TODO Auto-generated method stub
		List<BookVO> randomList =bookDAO.randomList();
		return randomList;
	}
}
