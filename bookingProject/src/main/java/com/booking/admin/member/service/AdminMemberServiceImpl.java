package com.booking.admin.member.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.booking.admin.member.dao.AdminMemberDAO;
import com.booking.member.vo.MemberVO;




@Service
@Transactional
public class AdminMemberServiceImpl implements AdminMemberService {
	Logger logger = Logger.getLogger(AdminMemberServiceImpl.class);
	
	@Autowired
	private AdminMemberDAO adminMemberDAO;

	@Override
	public List<MemberVO> memberList(MemberVO mvo){

		List<MemberVO> memberList = adminMemberDAO.memberList(mvo);
		
		return memberList;
	}

}
