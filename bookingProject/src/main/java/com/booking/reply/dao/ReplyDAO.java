package com.booking.reply.dao;

import java.util.List;

import com.booking.reply.vo.ReplyVO;

public interface ReplyDAO {

	public List<ReplyVO> replyList(Integer bd_post_no);

	public int replyInsert(ReplyVO rvo);

	public int replyUpdate(ReplyVO rvo);

	public int replyDelete(Integer re_no);

	public int pwdConfirm(ReplyVO rvo);

	public int replyChoiceDelete(int bd_post_no);
}
