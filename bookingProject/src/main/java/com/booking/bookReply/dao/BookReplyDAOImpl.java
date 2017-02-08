
package com.booking.bookReply.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.booking.bookReply.vo.BookReplyVO;

@Repository
public class BookReplyDAOImpl implements BookReplyDAO{
	Logger logger = Logger.getLogger(BookReplyDAOImpl.class);
	
	@Autowired
	private SqlSession session;
	
	//댓글 목록
	@Override
	public List<BookReplyVO> bReplyList(String isbn) {
		return session.selectList("bReplyList", isbn);
	}

	//댓글쓰기
	@Override
	public int bReplyInsert(BookReplyVO brvo) {
		return session.insert("bReplyInsert", brvo);
	}

	//댓글 수정
	@Override
	public int bReplyUpdate(BookReplyVO brvo) {
		return session.update("bReplyUpdate", brvo);
		
	}

	//댓글 삭제
	@Override
	public int bReplyDelete(Integer br_no) {
		return session.delete("bReplyDelete", br_no);
	}

	//책 삭제시 댓글도 삭제
	@Override
	public int bReplyChoiceDelete(String isbn) {
		return session.delete("bReplyChoiceDelete", isbn);
	}

}
