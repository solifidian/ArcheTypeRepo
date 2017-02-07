package com.booking.admin.member.dao;

import java.util.List;

import com.booking.member.vo.MemberVO;

public interface AdminMemberDAO {
	
	public List<MemberVO> memberList(MemberVO mvo);
	
}
