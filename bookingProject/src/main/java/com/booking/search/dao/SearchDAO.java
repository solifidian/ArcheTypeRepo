package com.booking.search.dao;

import java.util.List;

import com.booking.book.vo.BookVO;
import com.booking.search.vo.SearchVO;




public interface SearchDAO {
	public List<SearchVO> booksearchlist(SearchVO svo);
	public SearchVO booksearchdetail(SearchVO svo);
	
	public List<BookVO> bookList(BookVO bvo);
	public int bookSearchTotal(BookVO bvo);
	public BookVO bookSelect(String isbn);
	public String isbnCheck(String isbn);
	
	
}
