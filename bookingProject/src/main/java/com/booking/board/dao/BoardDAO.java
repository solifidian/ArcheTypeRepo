package com.booking.board.dao;

import java.util.List;

import com.booking.board.vo.BoardVO;
import com.booking.board.vo.FaqVO;

public interface BoardDAO {

	public List<BoardVO> boardList(BoardVO bvo);

	public int boardInsert(BoardVO bvo);

	public BoardVO boardDetail(BoardVO bvo);

	public int readCount(BoardVO bvo);

	public int boardUpdate(BoardVO bvo);

	public int boardDelete(int bd_post_no);

	public int pwdConfirm(BoardVO bvo);

	public int boardListCnt(BoardVO bvo);
	
	public List<FaqVO> faqList();

}
