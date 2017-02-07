package com.booking.admin.book.dao;

import java.util.List;

import com.booking.admin.book.vo.BookReleaseVO;
import com.booking.admin.book.vo.BookStockVO;
import com.booking.book.vo.BookVO;

public interface AdminBookDAO {

	public List<BookStockVO> bookStockList(BookStockVO bsvo);
	public int bookStockTotal(BookStockVO bsvo);
	public int bookStockInsert(BookStockVO bsvo);
	public int bookStockIn(BookStockVO bsvo);
	
	public List<BookReleaseVO> bookReleaseList(BookReleaseVO bsvo);
	public int bookReleaseTotal(BookReleaseVO bsvo);
	public int bookReleaseInsert(BookReleaseVO bsvo);
	public int bookReleaseOut(BookReleaseVO bsvo);
	
	public List<BookVO> bookList(BookVO bvo);
	public int bookSearchTotal(BookVO bvo);
	public BookVO bookSelect(String isbn);
	public String isbnCheck(String isbn);
	public int bookInsert(BookVO bvo);
	public int bookUpdate(BookVO bvo);
	
	
	
	
	
}
