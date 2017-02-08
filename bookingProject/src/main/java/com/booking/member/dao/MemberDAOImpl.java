package com.booking.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.booking.book.vo.Purchase_DeliveryVO;
import com.booking.book.vo.Purchase_relVO;
import com.booking.member.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Autowired
	private SqlSession session;
	
	//로그인 하기
	@Override
	public MemberVO memberLogin(MemberVO mvo){
		return session.selectOne("memberLogin", mvo);
	}
	
	//주문내역 불러오기
	@Override
	public List<Purchase_DeliveryVO> myPurchase(Purchase_DeliveryVO listVO){
		return session.selectList("myPurchase", listVO);
	}
	
	//주문내역 불러오기
	@Override
	public List<Purchase_DeliveryVO> myDelivery(Purchase_DeliveryVO listVO){
		return session.selectList("myDelivery", listVO);
	}
	
	
	//주문전체레코드수
	@Override
	public int myPurchaseCnt(MemberVO mvo){
		return (Integer)session.selectOne("myPurchaseCnt", mvo);
	}
	
	//배송전체레코드수
	@Override
	public int myDeliveryCnt(MemberVO mvo){
		return (Integer)session.selectOne("myDeliveryCnt", mvo);
	}
	
	//회원가입
	@Override
	public int memberInsert(MemberVO mvo) {		
		return session.insert("memberInsert", mvo);
	}

	//회원목록보기
	@Override
	public List<MemberVO> memberList(MemberVO mvo) {		
		return session.selectList("memberList");
	}

	//회원수정 화면 보기
	@Override
	public MemberVO memberDetail(MemberVO mvo) {
		return (MemberVO)session.selectOne("memberDetail", mvo);
	}

	//회원수정
	@Override
	public int memberUpdate(MemberVO mvo) {
		return session.update("memberUpdate", mvo);
	}

	//회원 탈퇴
	@Override
	public int memberDelete(MemberVO mvo) {
		return session.delete("memberDelete", mvo);
	}

	//아이디 중복체크
	@Override
	public int idChk(MemberVO mvo) {
		return session.selectOne("idChk", mvo);
	}

	//아이디 찾기
	@Override
	public MemberVO findId(MemberVO mvo) {		
		return session.selectOne("findId", mvo);
	}

	//비밀번호 찾기
	@Override
	public MemberVO findPwd(MemberVO mvo) {
		return session.selectOne("findPwd", mvo);
	}
	//주문 상세보기 클릭
	@Override
	public List<Purchase_relVO> purchaseDetail(Purchase_DeliveryVO pvo){
		return session.selectList("purchaseDetail", pvo);
	}
}
