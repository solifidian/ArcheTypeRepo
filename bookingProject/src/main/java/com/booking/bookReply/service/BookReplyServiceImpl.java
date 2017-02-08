package com.booking.bookReply.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.booking.bookReply.dao.BookReplyDAO;
import com.booking.bookReply.vo.BookReplyVO;

@Service
@Transactional
public class BookReplyServiceImpl implements BookReplyService{
	Logger logger = Logger.getLogger(BookReplyServiceImpl.class);
	
	@Autowired
	private BookReplyDAO bookReplyDAO;
	
	//댓글목록
	@Override
	public List<BookReplyVO> bReplyList(String isbn) {
		List<BookReplyVO> myList = null;
		myList = bookReplyDAO.bReplyList(isbn);
		return myList;
	}

	//댓글입력
	@Override
	public int bReplyInsert(BookReplyVO brvo) {
		int result = 0;
		result = bookReplyDAO.bReplyInsert(brvo);
		return result;
	}

	//댓글수정
	@Override
	public int bReplyUpdate(BookReplyVO brvo) {
		int result = 0;
		result = bookReplyDAO.bReplyUpdate(brvo);
		return result;		
	}

	//댓글삭제
	@Override
	public int bReplyDelete(Integer br_no) {
		int result = 0;
		result = bookReplyDAO.bReplyDelete(br_no);
		return result;		
	}

}
