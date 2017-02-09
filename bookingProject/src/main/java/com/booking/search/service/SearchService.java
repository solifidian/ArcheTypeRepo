package com.booking.search.service;

import java.util.List;

import com.booking.search.vo.SearchVO;


public interface SearchService {
	public List<SearchVO> booksearchlist(SearchVO svo);
	public SearchVO booksearchdetail(SearchVO svo);
	public List<SearchVO> bookForeignList(SearchVO svo);
	public List<SearchVO> bookDomesticList(SearchVO svo);
}
