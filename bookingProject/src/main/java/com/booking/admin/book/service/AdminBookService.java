package com.booking.admin.book.service;

import java.util.List;

import com.booking.admin.book.vo.BookReleaseVO;
import com.booking.admin.book.vo.BookStockVO;
import com.booking.book.vo.BookVO;

public interface AdminBookService {

	public List<BookStockVO> bookStockList(BookStockVO bsvo);
	public int bookStockInsert(BookStockVO bsvo);
	
	public List<BookReleaseVO> bookReleaseList(BookReleaseVO bsvo);
	public int bookReleaseInsert(BookReleaseVO brvo);
	
	public List<BookVO> bookList(BookVO bvo);
	public String isbnCheck(String isbn);
	
	public int bookSearchTotal(BookVO bvo);
	public BookVO bookSelect(String isbn);
	public int bookInsert(BookVO bvo);
	public int bookUpdate(BookVO bvo);
}
