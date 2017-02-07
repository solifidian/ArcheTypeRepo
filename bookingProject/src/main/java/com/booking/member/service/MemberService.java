
package com.booking.member.service;

import java.util.List;

import com.booking.book.vo.Purchase_DeliveryVO;
import com.booking.member.vo.MemberVO;

public interface MemberService {
	public MemberVO memberLogin(MemberVO mvo);
	public List<Purchase_DeliveryVO> memberMypage(MemberVO mvo);
	
	public List<MemberVO> memberList(MemberVO mvo);
	
	public int memberInsert(MemberVO mvo);

	public MemberVO memberDetail(MemberVO mvo);

	public int memberUpdate(MemberVO mvo);

	public int memberDelete(MemberVO mvo);

	public int idChk(MemberVO mvo);

	public MemberVO findId(MemberVO mvo);

	public MemberVO findPwd(MemberVO mvo);
}
