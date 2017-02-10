package com.booking.board.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.booking.board.dao.BoardDAO;
import com.booking.board.vo.BoardVO;
import com.booking.reply.dao.ReplyDAO;
import com.booking.reply.vo.ReplyVO;

@Service
public class BoardServiceImpl implements BoardService{
	Logger logger = Logger.getLogger(BoardServiceImpl.class);
	
	@Autowired
	private BoardDAO boardDAO;
	
	@Autowired
	private ReplyDAO replyDAO;
	
	//게시글 목록
	@Override
	public List<BoardVO> boardList(BoardVO bvo) {
		List<BoardVO> myList = null;
		myList = boardDAO.boardList(bvo);		
		return myList;
	}

	//글쓰기
	@Override
	public int boardInsert(BoardVO bvo) {
		int result = 0;
		result = boardDAO.boardInsert(bvo);
		return result;
	}

	//글 상세보기(+조회수 증가)
	@Override
	public BoardVO boardDetail(BoardVO bvo) {
		BoardVO detail = null;
		boardDAO.readCount(bvo);		
		detail = boardDAO.boardDetail(bvo);
			
		return detail;
	}

	//글 수정
	@Override
	public int boardUpdate(BoardVO bvo) {
		int result = 0;
		result = boardDAO.boardUpdate(bvo);
		return result;
	}

	//글 삭제
	@Override
	public int boardDelete(int bd_post_no) {
		int result = 0;
		
		List<ReplyVO> list = replyDAO.replyList(bd_post_no);
		if(!list.isEmpty()){
			result = replyDAO.replyChoiceDelete(bd_post_no);
		}
		result = boardDAO.boardDelete(bd_post_no);
		return result;
	}

	//비밀번호 체크
	@Override
	public int pwdConfirm(BoardVO bvo) {
		int result = 0;
		result = boardDAO.pwdConfirm(bvo);
		
		return result;
	}

	//전체 레코드 수 구현
	@Override
	public int boardListCnt(BoardVO param) {
		return boardDAO.boardListCnt(param);
	}


}
