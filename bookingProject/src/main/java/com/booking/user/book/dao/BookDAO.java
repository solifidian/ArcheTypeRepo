package com.booking.user.book.dao;

import java.util.List;

import com.booking.book.vo.BookVO;


public interface BookDAO {
	
	public BookVO bookDetail(BookVO bvo);
	public List<BookVO> bookList(BookVO bvo);
	public int bookSearchTotal(BookVO bvo);
	public BookVO bookSelect(String isbn);
	public String isbnCheck(String isbn);
	
	public List<BookVO> etcListCall();
	

	public List<BookVO> list1();
	public List<BookVO> list2();
	public List<BookVO> list3();
	public List<BookVO> list4();
	public List<BookVO> list5();
	
	public List<BookVO> randomList();
	public List<BookVO> monthList();

}
