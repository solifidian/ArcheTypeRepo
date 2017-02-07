package com.booking.admin.book.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.booking.admin.book.vo.BookReleaseVO;
import com.booking.admin.book.vo.BookStockVO;
import com.booking.book.vo.BookVO;

@Repository
public class AdminBookDAOImpl implements AdminBookDAO{

	@Autowired
	private SqlSession session;
	
	/****************************************
	 * Stock DAO
	 ************************************/
	@Override
	public List<BookStockVO>bookStockList(BookStockVO bsvo){
		return session.selectList("bookStockList", bsvo);
	}
	@Override
	public int bookStockTotal(BookStockVO bsvo){
		return session.selectOne("bookStockTotal",bsvo);
	}
	@Override
	public int bookStockInsert(BookStockVO bsvo){
		return session.insert("bookStockInsert", bsvo);
	}
	@Override
	public int bookStockIn(BookStockVO bsvo){
		return session.update("bookStockIn",bsvo);
	}
	
	/************************************************
	 * Release DAO
	 ***************************************************/
	@Override
	public List<BookReleaseVO> bookReleaseList(BookReleaseVO brvo){
		return session.selectList("bookReleaseList", brvo);
	}
	@Override
	public int bookReleaseTotal(BookReleaseVO brvo){
		return session.selectOne("bookReleaseTotal", brvo);
	}
	@Override
	public int bookReleaseInsert(BookReleaseVO brvo){
		return session.insert("bookReleaseInsert",brvo);
	}
	@Override
	public int bookReleaseOut(BookReleaseVO brvo){
		return session.update("bookReleaseOut",brvo);
	}
	
	/****************************************************
	 * Book DAO
	 ****************************************************/
	@Override
	public List<BookVO> bookList(BookVO bvo){
		return session.selectList("bookList",bvo);
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
	public int bookInsert(BookVO bvo){
		return session.insert("bookInsert",bvo);
	}
	@Override
	public int bookUpdate(BookVO bvo){
		return session.update("bookUpdate",bvo);
	}
	
	
}
