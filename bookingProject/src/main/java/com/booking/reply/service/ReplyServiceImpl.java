package com.booking.reply.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.booking.reply.dao.ReplyDAO;
import com.booking.reply.vo.ReplyVO;

@Service
@Transactional
public class ReplyServiceImpl implements ReplyService{
	Logger logger = Logger.getLogger(ReplyServiceImpl.class);
	
	@Autowired
	private ReplyDAO replyDAO;
	
	//글 목록 구현
	@Override
	public List<ReplyVO> replyList(Integer bd_post_no) {
		List<ReplyVO> myList = null;
		myList = replyDAO.replyList(bd_post_no);
		return myList;
	}

	//댓글쓰기
	@Override
	public int replyInsert(ReplyVO rvo) {
		int result = 0;
		result = replyDAO.replyInsert(rvo);
		return result;
	}

	//댓글 수정
	@Override
	public int replyUpdate(ReplyVO rvo) {
		int result = 0;
		result = replyDAO.replyUpdate(rvo);
		return result;
	}

	//댓글 삭제
	@Override
	public int replyDelete(Integer re_no) {
		int result = 0;
		result = replyDAO.replyDelete(re_no);
		return result;	
	}

	//비밀번호 체크
	@Override
	public int pwdConfirm(ReplyVO rvo) {
		int result = 0;
		result =  replyDAO.pwdConfirm(rvo);
		return result;
	}

}
