package com.booking.bookReply.dao;

import java.util.List;

import com.booking.bookReply.vo.BookReplyVO;


public interface BookReplyDAO {

	public List<BookReplyVO> bReplyList(String isbn);

	public int bReplyInsert(BookReplyVO brvo);

	public int bReplyUpdate(BookReplyVO brvo);

	public int bReplyDelete(Integer br_no);
	
	public int bReplyChoiceDelete(String isbn);

}
