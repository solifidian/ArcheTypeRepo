package com.booking.search.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.booking.book.vo.BookVO;
import com.booking.search.vo.SearchVO;



@Repository
public class SearchDAOImpI implements SearchDAO{

		@Autowired
		public SqlSession session;
		
	@Override
	public List<SearchVO> booksearchlist(SearchVO svo) {
		// TODO Auto-generated method stub
		return session.selectList("booksearchlist");
		
	}

	@Override
	public SearchVO booksearchdetail(SearchVO svo) {
		// TODO Auto-generated method stub
		return session.selectOne("booksearchdetail");
	}

	@Override
	public int bookSearchTotal(BookVO bvo){
		return session.selectOne("bookSearchTotal",bvo);
	}
	@Override
	public BookVO bookSelect(String isbn){
		return session.selectOne("bookSelect",isbn);
	}
	@Override
	public String isbnCheck(String isbn){
		return session.selectOne("isbnCheck",isbn);
	}

	@Override
	public List<BookVO> bookList(BookVO bvo){
		return session.selectList("bookList",bvo);
	}

	@Override
	public List<SearchVO> bookForeignList(BookVO bvo) {
		// TODO Auto-generated method stub
		return session.selectList("bookForeignList", bvo);
	}

	@Override
	public List<SearchVO> bookForeignList(SearchVO svo) {
		
		return session.selectList("bookForeignList", svo);
	}

	@Override
	public List<SearchVO> bookDomesticList(SearchVO svo) {
		// TODO Auto-generated method stub
		return session.selectList("bookDomesticList",svo);
	}

	@Override
	public List<SearchVO> bookDomesticList(BookVO bvo) {
		// TODO Auto-generated method stub
		return session.selectList("bookDomesticList", bvo);
	}
}
