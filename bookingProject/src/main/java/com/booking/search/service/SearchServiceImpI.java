package com.booking.search.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.booking.search.dao.SearchDAO;
import com.booking.search.vo.SearchVO;

@Service
@Transactional
public class SearchServiceImpI implements SearchService{
	
	@Autowired
	public SearchDAO searchDAO; 
	
	@Override
	public List<SearchVO> booksearchlist(SearchVO svo) {
		// TODO Auto-generated method stub
		List<SearchVO> list=searchDAO.booksearchlist(svo);
		return list;
	}

	@Override
	public SearchVO booksearchdetail(SearchVO svo) {
		// TODO Auto-generated method stub
		return searchDAO.booksearchdetail(svo);
	}

	@Override
	public List<SearchVO> bookForeignList(SearchVO svo) {
		List<SearchVO> list=searchDAO.bookForeignList(svo);
		return list;
	}

	@Override
	public List<SearchVO> bookDomesticList(SearchVO svo) {
		List<SearchVO> list=searchDAO.bookDomesticList(svo);
		return list;
	}

}
