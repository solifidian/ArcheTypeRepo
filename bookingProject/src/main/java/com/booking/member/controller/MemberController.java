package com.booking.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.booking.admin.sitelog.service.SiteLogService;
import com.booking.book.vo.Purchase_DeliveryVO;

import com.booking.common.util.Util;
import com.booking.common.util.email.EmailVO;
import com.booking.common.util.email.Emailsend;
import com.booking.book.vo.Purchase_relVO;
import com.booking.common.paging.Paging;
import com.booking.member.service.MemberService;
import com.booking.member.vo.MemberVO;

@Controller
@RequestMapping(value="/member")
public class MemberController {
	Logger logger = Logger.getLogger(MemberController.class);
	
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private SiteLogService siteLogService;
	
	
	// 로그인페이지로 이동
	@RequestMapping(value="/memberLoginPage.do")
	public String memberLoginPage(){
		return "member/memberLoginPage";
	}
	
	
	// 마이페이지로 이동
	@RequestMapping(value="/memberMypage.do")
	public String memberMypage(@ModelAttribute Purchase_DeliveryVO listVO, Model model, HttpServletRequest request, HttpSession session){
		logger.info("memberMypage 호출 성공");

		/* *******************************
		 * session으로부터 M_no 전달.
		 * null이면 0으로 반환
		 * */
		MemberVO mvo = (MemberVO)session.getAttribute("memSession");
		if(mvo != null){
			listVO.setM_no(mvo.getM_no());
		}else{
			listVO.setM_no(0);
		}
		
		//listData default nvl
		listVO.setOrderDirection("desc");
		listVO.setOrderTarget("p_no");
		
		Paging.setBookPaging(listVO);
		
		/*********************
		 * 선택 되지 않은 List는 null값만 jsp페이지로 보내게 됨
		 ********************/
		List<Purchase_DeliveryVO> pvoList = null;
		List<Purchase_DeliveryVO> dvoList = null;
		
		if(listVO.getPur_del_mode() != null){
			//배송 내역이 선택
			logger.info("mode: "+listVO.getPur_del_mode());
			if(listVO.getPur_del_mode().equals("deliveryTable")){
				listVO.setSearchMode("deliveryTable");
				dvoList = memberService.myDelivery(listVO);
				listVO.setSearchTotal(memberService.myDeliveryCnt(listVO));
			}
			//주문 내역이 선택
			else if(listVO.getPur_del_mode().equals("purchaseTable")){
				listVO.setSearchMode("purchaseTable");
				pvoList = memberService.myPurchase(listVO);
				listVO.setSearchTotal(memberService.myPurchaseCnt(listVO));
			}
		}else{
			//default값은 주문 내역으로
			listVO.setSearchMode("purchaseTable");
			pvoList = memberService.myPurchase(listVO);
			listVO.setSearchTotal(memberService.myPurchaseCnt(listVO));
		}
				
		model.addAttribute("purchase", pvoList);
		model.addAttribute("delivery", dvoList);
		model.addAttribute("listData", listVO);
		
		
		return "member/memberMypage";
	}
	
	
	
	
	
	//boots_view (상세보기 클릭 )
	@ResponseBody
	@RequestMapping(value="/boots_view.do")
	public ResponseEntity<List<Purchase_relVO>> boots_view(@ModelAttribute Purchase_DeliveryVO pvo, Model model){
		logger.info("boots_view 호출 성공");
		
		ResponseEntity<List<Purchase_relVO>> entity = null;
		logger.info("요청받은 주문번호 = "+pvo.getP_no());
		
		
		List<Purchase_relVO> plist = memberService.purchaseDetail(pvo.getP_no());
		logger.info(plist);
		logger.info("사이즈"+plist.size());
		
		model.addAttribute("pdetail", plist);
		String result="success";
		
		
		try {
			entity = new ResponseEntity<List<Purchase_relVO>> (memberService.purchaseDetail(pvo.getP_no()), HttpStatus.OK);
			logger.info("성공"+entity);
		}catch (Exception e) {
			entity = new ResponseEntity<List<Purchase_relVO>> (HttpStatus.BAD_REQUEST);
			logger.info("실패"+entity);
		}
		return entity;
	}
	
	
	
	//로그인하기 
	@RequestMapping(value="/memberLogin.do")
	public String memberLogin(@ModelAttribute MemberVO mvo, Model model, HttpServletRequest request, HttpSession session){
		logger.info("memberLogin 호출 성공");
		String resultData = ""; // SUCCESS 단어가 들어가있으면 성공으로 간주
		String resultMessage = ""; // ""으로 놔두면 alert 안 뜸
		String redirectURL = "/book/bookIndex.do";
		
		String id = mvo.getM_id();
		String pwd = mvo.getM_pwd();
		logger.info("고객이 입력한 id =" +id + " pwd = " + pwd );
		
		MemberVO memVO = new MemberVO();
		
		memVO = memberService.memberLogin(mvo);
		if(memVO!=null){
			// 세션 , 쿠키값 뿌려주기
			session.setAttribute("memSession", memVO);
			/*Cookie cookie = new Cookie("id", memVO.getM_id());
			cookie.setMaxAge(7*24*60*1);*/

			resultData = "LOGIN SUCCESS";
			resultMessage = "";
			siteLogService.siteLogUpdate(request,"Login","ID : "+memVO.getM_id());
		}else {
			
			resultData = "LOGIN FAILED";
			resultMessage = "아이디나 패스워드가 틀렸습니다";
			
		}
		
		model.addAttribute("resultData", resultData);
		model.addAttribute("resultMessage", resultMessage);
		model.addAttribute("redirectURL", redirectURL);
		
		return "common/resultPage";
	}
	
	//로그아웃
	@RequestMapping(value="/memberLogout.do")
	public String memberLogout(@ModelAttribute MemberVO mvo, Model model, HttpServletRequest request, HttpSession session){
		logger.info("memberLogout 호출 성공");
		String resultData = ""; // SUCCESS 단어가 들어가있으면 성공으로 간주
		String resultMessage = ""; // ""으로 놔두면 alert 안 뜸
		String redirectURL = "/book/bookIndex.do";
		
		MemberVO memSession = (MemberVO)session.getAttribute("memSession");
		siteLogService.siteLogUpdate(request,"LogOut","ID : "+memSession.getM_id());
		
		session.removeAttribute("memSession");
		resultData = "SUCCESS";
		resultMessage = "로그아웃 되었습니다.";
		
		model.addAttribute("resultData", resultData);
		model.addAttribute("resultMessage", resultMessage);
		model.addAttribute("redirectURL", redirectURL);
		
		
		
		return "common/resultPage";
	}
	/***********************************
	 * 회원가입 폼 출력하기
	 * ***************************/
	 @RequestMapping(value="/memberForm.do")	 	
	public String memberInsertForm(){
		 logger.info(" memberInsertForm 호출 성공");
		return "member/memberForm";
	}
	 
	 //회원 목록 구현
	 @RequestMapping(value="/memberList.do")
	 public String memberList(@ModelAttribute MemberVO mvo, Model model){
		 logger.info("memberList 호출 성공");
		
		 List<MemberVO> memberList = memberService.memberList(mvo);
		 
		 model.addAttribute("memberList", memberList);
		 model.addAttribute("data", mvo);
		 
		 return "member/memberList";
		 		 
	 }
	 
			
	//회원등록

	@ResponseBody
	@RequestMapping(value="/memberInsert.do")
	public String memberInsert(@ModelAttribute MemberVO mvo){
		logger.info("memberInsert 호출 성공");
			
		int result = 0;		
		String resultStr ="FAILED";
		
		result = memberService.memberInsert(mvo);
		if(result==1){
			resultStr ="SUCCESS";
		}		
		return resultStr;
	}
	
	//회원수정 폼 출력
	@RequestMapping(value="/memberUpdateForm.do")
	public String memberUpdateForm(@ModelAttribute MemberVO mvo, Model model, HttpSession session){
		logger.info("memberUpdateForm 호출 성공");	
		
		MemberVO updateData = (MemberVO)session.getAttribute("memSession");
		/*mvo.setM_no(35);*/
		logger.info("m_no : "+updateData.getM_no());
		updateData = memberService.memberDetail(updateData);
		
		model.addAttribute("updateData", updateData);
		return "member/memberUpdateForm";
	}
	
	//회원수정
	@ResponseBody
	@RequestMapping(value="/memberUpdate.do")
	public String memberUpdate(@ModelAttribute MemberVO mvo, HttpSession session){
		logger.info("memberUpdate 호출 성공");
		/**********************************
		 * 세션 확인
		 * memSession is not null = 회원
		 *********************************/
		String m_id = "";
		int m_no = 0;
		MemberVO memSession = (MemberVO)session.getAttribute("memSession");
		
		if(memSession != null && !memSession.getM_id().equals("")){
			logger.info("회원 확인 됨");
			m_id = memSession.getM_id();			
			m_no = memSession.getM_no();			
		}
		/*********** 세션 확인 종료 ***********/	
		logger.info("memSession.m_id :"+memSession.getM_id());
		logger.info("memSession.m_no :"+memSession.getM_no());
		int result = 0;
		String resultStr ="FAILED";
		String url = "";
		mvo.setM_no(m_no);
		mvo.setM_id(m_id);
		logger.info("mvo.m_no:"+mvo.getM_no());
		logger.info("mvo.m_id:"+mvo.getM_id());
		logger.info("mvo.m_nick:"+mvo.getM_nick());
		result = memberService.memberUpdate(mvo);
		logger.info("result :"+result);
		if(result==1){
			resultStr ="SUCCESS";
			/************  세션 갱신  시작 **************/
			MemberVO memVO = memberService.memberLogin(mvo);
			if(memVO!=null){
				// 세션 , 쿠키값 뿌려주기
				session.setAttribute("memSession", memVO);
			}
			/************  세션 갱신 종료 **************/
		}		
		return resultStr;
	}	

	//회원탈퇴
	@RequestMapping(value="/memberDelete.do")
	public String memberDelete(@ModelAttribute MemberVO mvo){
		logger.info("memberDelete 호출 성공");
		
		int result = 0;
		String url = "";
		
		result = memberService.memberDelete(mvo);
		if(result == 1){
			logger.info(result);
			url = "/member/memberLogout.do";	//회원탈퇴후 로그아웃으로
		}
		
		 return "redirect:"+url;
	}
	
	//아이디 중복체크
	@ResponseBody
	@RequestMapping(value="/idChk.do")
	public String idChk(@ModelAttribute MemberVO mvo){
		logger.info("idChk 호출 성공");
		int result = 0;
		
		result = memberService.idChk(mvo);
		logger.info("m_id :"+mvo.getM_id());
		logger.info("result ="+result);		
		
		return result+"";
	}
	/***********************************
	 * 아이디 비밀번호찾기 폼 출력하기
	 * ***************************/
	 @RequestMapping(value="/findIdPwdForm.do")	 	
	public String findIdPwdForm(){
		 logger.info(" findIdPwdForm 호출 성공");
		return "member/findIdPwd";
	}
	 
	

	//아이디찾기
	@ResponseBody
	@RequestMapping(value="/findId.do")
	public String findId(@ModelAttribute MemberVO mvo){
		logger.info("findId 호출 성공");
		
		MemberVO result = null;
		
		result = memberService.findId(mvo);
		logger.info("m_name :" +mvo.getM_name());
		logger.info("m_email:"+mvo.getM_email());		
		logger.info("m_id :"+result.getM_id());
					
		return result.getM_id();
	}
	
	//비밀번호찾기
	@ResponseBody
	@RequestMapping(value="/findPwd.do")
	public String findPwd(@ModelAttribute MemberVO mvo){
		logger.info("findPwd 호출 성공");
		
		MemberVO result = null;
		
		result = memberService.findPwd(mvo);
		logger.info("m_id :"+mvo.getM_id());
		logger.info("m_pwd :"+result.getM_pwd());
						
		return result.getM_pwd();
	}
	
	
	
	
	
	//본인인증 관련 추가 부분
    //이메일 발송
	 @ResponseBody
	 @RequestMapping(value="/emailchk.do")
	 public String emailchk(@ModelAttribute MemberVO mvo, HttpSession session){
	 logger.info("이메일 발송 호출 성공");
	 String key=session.getId();
	 String result="";
	
	 //키 암호화
	 String shakey=Util.sha256(key);
	 
	 
	 //인증 여부 확인 
	   
	 
        /* String url = "http://172.16.9.173:8080/member/emailconfirm.do?key=" + shakey; */
         String url = key;   
         EmailVO vo = new EmailVO();
         vo.setEmailFrom("yoonjh238@gmail.com");
         vo.setEmailFromName("도서왕 북킹.");

         vo.setEmailTo(mvo.getM_email());
         vo.setEmailToName(mvo.getM_email());
         vo.setEmailSubject("관리자 본인인증 메일 ");
         vo.setEmailMsg("booking code : "+url);
      
         Emailsend se = new Emailsend();
         se.sendEmail(vo);

         result = "success";
	 
	 
	 
	 return result;
     
	 
	 }

	 //이메일 인증
	 @ResponseBody
	 @RequestMapping(value="/emailconfirm.do",method=RequestMethod.GET)
	 public String emailconfirm(@RequestParam("key") String key,Model model ,HttpSession session){
		 logger.info("이메일 인증 호출 성공");
		 String serverkey=session.getId();
		 	 
		 String result="";
		 
		 //키 암호화
		 String shakey=Util.sha256(key);
		
		 if(serverkey.equals(key)){
			 logger.info("본인인증 성공");
			 result="success";
			 
		 }else{
			 logger.info("본인 인증 실패");
		 }
		 
		 
		 return result;
	 }
	
}
