package com.booking.user.book.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.booking.book.vo.BookVO;

@Repository
public class BookDAOImpl implements BookDAO{
	
	@Autowired
	private SqlSession session;
	
	
	//디테일 구현
	@Override
	public BookVO bookDetail(BookVO bvo){
		return session.selectOne("bookDetail" , bvo);
	}
	
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
	public List<BookVO> etcListCall() {
		// TODO Auto-generated method stub
		return  session.selectList("etcListCall");
	}

	@Override
	public List<BookVO> list1() {
		// TODO Auto-generated method stub
		return session.selectList("list1");
	}

	@Override
	public List<BookVO> list2() {
		// TODO Auto-generated method stub
		return session.selectList("list2");
	}

	@Override
	public List<BookVO> list3() {
		// TODO Auto-generated method stub
		return session.selectList("list3");
	}

	@Override
	public List<BookVO> list4() {
		// TODO Auto-generated method stub
		return session.selectList("list4");
	}

	@Override
	public List<BookVO> list5() {
		// TODO Auto-generated method stub
		return session.selectList("list5");
	}
	
	@Override
	public List<BookVO> randomList() {
		// TODO Auto-generated method stub
		return session.selectList("randomList");
	}
	
	@Override
	public List<BookVO> monthList() {
		// TODO Auto-generated method stub
		return session.selectList("monthList");
	}
}
