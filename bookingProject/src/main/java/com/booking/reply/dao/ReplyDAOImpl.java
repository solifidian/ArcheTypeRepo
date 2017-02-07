package com.booking.reply.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.booking.reply.vo.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO{
	Logger logger = Logger.getLogger(ReplyDAOImpl.class);
	
	@Autowired
	private SqlSession session;
	
//글 목록 구현
	@Override
	public List<ReplyVO> replyList(Integer bd_post_no) {
		return session.selectList("replyList", bd_post_no);
	}

	
//댓글쓰기
	@Override
	public int replyInsert(ReplyVO rvo) {
		return session.insert("replyInsert", rvo);
	}

//댓글 수정
	@Override
	public int replyUpdate(ReplyVO rvo) {
		return session.update("replyUpdate", rvo);
	}


//댓글 삭제
	@Override
	public int replyDelete(Integer re_no) {
		return session.delete("replyDelete", re_no);
	}


//비밀번호 체크
	@Override
	public int pwdConfirm(ReplyVO rvo) {
		return session.selectOne("pwdConfirm", rvo);
	}


//게시물 삭제하기 위한 댓삭
	@Override
	public int replyChoiceDelete(int bd_post_no) {
		return session.delete("replyChoiceDelete", bd_post_no);
	}

}
