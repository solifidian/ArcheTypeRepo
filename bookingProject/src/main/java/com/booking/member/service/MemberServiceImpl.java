package com.booking.member.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.booking.book.vo.Purchase_DeliveryVO;
import com.booking.book.vo.Purchase_relVO;
import com.booking.member.dao.MemberDAO;
import com.booking.member.vo.MemberVO;




@Service
@Transactional
public class MemberServiceImpl implements MemberService {
	Logger logger = Logger.getLogger(MemberServiceImpl.class);
	
	@Autowired
	private MemberDAO memberDAO;
	
	
	
	//로그인
	@Override
	public MemberVO memberLogin(MemberVO mvo){
		MemberVO bookId = null;
		bookId = memberDAO.memberLogin(mvo);
		
		return bookId;
	}
	
	
	//주문내역
	@Override
	public List<Purchase_DeliveryVO> myPurchase(Purchase_DeliveryVO listVO){
		List<Purchase_DeliveryVO> pvo = null;
		pvo = memberDAO.myPurchase(listVO);
		
		
		
		return pvo;
	}
	
	//배송내역
	@Override
	public List<Purchase_DeliveryVO> myDelivery(Purchase_DeliveryVO listVO){
		List<Purchase_DeliveryVO> pvo = null;
		pvo = memberDAO.myDelivery(listVO);
			
			
			
		return pvo;
	}
	
	//주문전체레코드수
	@Override
	public int myPurchaseCnt(Purchase_DeliveryVO listVO){
		return  memberDAO.myPurchaseCnt(listVO);
	}
	
	
	@Override
	public int myDeliveryCnt(Purchase_DeliveryVO listVO){
		return memberDAO.myDeliveryCnt(listVO);
	}
	
//회원 가입	
	@Override
	public int memberInsert(MemberVO mvo) {
		int result = 0;
		result = memberDAO.memberInsert(mvo);
		return result;
	}

//회원목록보기
	@Override
	public List<MemberVO> memberList(MemberVO mvo) {
		List<MemberVO> mList = null;
		mList = memberDAO.memberList(mvo);
		return mList;
	}

//회원 수정화면 보기
	@Override
	public MemberVO memberDetail(MemberVO mvo) {
		MemberVO detail = null;
		detail = memberDAO.memberDetail(mvo);
		return detail;
	}

	//회원수정
	@Override
	public int memberUpdate(MemberVO mvo) {
		int result = 0;
		result = memberDAO.memberUpdate(mvo);
		return result;
	}

	//회원탈퇴
	@Override
	public int memberDelete(MemberVO mvo) {
		int result = 0;
		result = memberDAO.memberDelete(mvo);
		return result;
	}

	//아이디 중복 체크
	@Override
	public int idChk(MemberVO mvo) {
		int result = 0;
		result = memberDAO.idChk(mvo);
		return result;
	}

	//아이디 찾기
	@Override
	public MemberVO findId(MemberVO mvo) {
		MemberVO result = null;
		result = memberDAO.findId(mvo);
		return result;
	}
	
	
	//비밀번호 찾기
	@Override
	public MemberVO findPwd(MemberVO mvo) {
		MemberVO result = null;
		result = memberDAO.findPwd(mvo);
		return result;
	}
	
	//주문 상세정보
	@Override
	public List<Purchase_relVO> purchaseDetail(int p_no){
		List<Purchase_relVO> result = null;
		result = memberDAO.purchaseDetail(p_no);
		return result;
	}
	

}
