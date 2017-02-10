package com.booking.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.booking.board.vo.BoardVO;

public class BoardDAOImpl implements BoardDAO{

	@Autowired
	private SqlSession session;
	
	//게시글 목록 구현
	@Override
	public List<BoardVO> boardList(BoardVO bvo) {
		return session.selectList("boardList");
	}

	//글쓰기
	@Override
	public int boardInsert(BoardVO bvo) {
		return session.insert("boardInsert");
	}

	//게시글 상세보기
	@Override
	public BoardVO boardDetail(BoardVO bvo) {
		return (BoardVO)session.selectOne("boardDetail", bvo);
	}

	//조회수 증가
	@Override
	public int readCount(BoardVO bvo) {		
		return session.selectOne("readCount", bvo);
	}

	//글 수정
	@Override
	public int boardUpdate(BoardVO bvo) {
		return session.update("boardUpdate", bvo);
	}

	//글 삭제
	@Override
	public int boardDelete(int bd_post_no) {
		return session.delete("boardDelete", bd_post_no);
	}

	//비밀번호 체크
	@Override
	public int pwdConfirm(BoardVO bvo) {
		return (Integer)session.selectOne("pwdConfirm", bvo);
	}

	//전체 레코드 건수 구현
	@Override
	public int boardListCnt(BoardVO bvo) {
		return (Integer)session.selectOne("boardListCnt", bvo);
	}

}
