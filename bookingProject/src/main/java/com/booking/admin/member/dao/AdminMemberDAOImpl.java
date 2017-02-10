package com.booking.admin.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.booking.member.vo.MemberVO;

@Repository
public class AdminMemberDAOImpl implements AdminMemberDAO {
	
	@Autowired
	private SqlSession session;
	
	// 회원 리스트
	@Override
	public List<MemberVO> memberList(MemberVO mvo){
		return session.selectOne("memberList", mvo);
	}
	
	@Override
	public int memberListTotal(MemberVO mvo){
		return session.selectOne("memberListTotal", mvo);
	}
	
	
}
