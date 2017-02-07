package com.booking.member.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.booking.admin.sitelog.service.SiteLogService;
import com.booking.book.vo.Purchase_DeliveryVO;
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
	public String memberMypage(@ModelAttribute MemberVO mvo, Model model, HttpServletRequest request){
		logger.info("memberMypage 호출 성공");
		HttpSession session = request.getSession();
		
		mvo = (MemberVO)session.getAttribute("memSession");
		
		logger.info("m_id"+mvo.getM_id());
		
		List<Purchase_DeliveryVO> pvo = memberService.memberMypage(mvo);
		
		logger.info(pvo);
		
		model.addAttribute("purchase", pvo);
		
		return "member/memberMypage";
	}
	
	
	
	
	
	//boots_view (상세보기 클릭 )
	@RequestMapping(value="/boots_view.do")
	public String boots_view(@ModelAttribute Purchase_DeliveryVO dvo, Model model){
		
		
		return "boots/boots_view";
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
	@RequestMapping(value="/memberInsert.do")
	public String memberInsert(@ModelAttribute MemberVO mvo){
		logger.info("memberInsert 호출 성공");
			
		int result = 0;
		String url = "";
		
		result = memberService.memberInsert(mvo);
		if(result == 1){
			url = "/member/memberLoginPage.do";	//로그인 페이지로 돌아가게 바꿀것!
		}
		
		return "redirect:"+url;
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
	@RequestMapping(value="/memberUpdate.do")
	public String memberUpdate(@ModelAttribute MemberVO mvo){
		logger.info("memberUpdate 호출 성공");
	/*	mvo.setM_no(35);*/
		logger.info("m_no : "+mvo.getM_no());
		int result = 0;
		String url = "";
		
		result = memberService.memberUpdate(mvo);
		
		if(result == 1){
			url = "/booking/boardlist.do";	//회원수정후 메인화면으로 돌리기
		}
		
		return "redirect : " + url;
	}	

	//회원탈퇴
	@RequestMapping(value="/memberDelete.do")
	public String memberDelete(@ModelAttribute MemberVO mvo){
		logger.info("memberDelete 호출 성공");
		
		int result = 0;
		String url = "";
		
		result = memberService.memberDelete(mvo);
		if(result == 1){
			url = "/booking/boardlist.do";	//회원탈퇴후 메인화면으로 돌리기
		}
		
		 return "redirect : " +url;
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
}
