package com.booking.admin.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.booking.admin.member.service.AdminMemberService;
import com.booking.admin.sitelog.service.SiteLogService;
import com.booking.common.paging.Paging;
import com.booking.member.service.MemberService;
import com.booking.member.vo.MemberVO;

@Controller
@RequestMapping(value="admin/member")
public class AdminMemberController {
	Logger logger = Logger.getLogger(AdminMemberController.class);
	
	
	@Autowired
	private AdminMemberService adminMemberService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private SiteLogService siteLogService;
	
	
	@RequestMapping(value="/memberList", method = RequestMethod.GET)
	public String memberList(@ModelAttribute MemberVO mvo, Model model, HttpServletRequest request){
		logger.info("memberList Called");
		
		/************* 관리자 계정아닐시 로그인 페이지로 던짐 시작***************/
		HttpSession session = request.getSession(false);
		if(session == null){
			return "redirect:/admin/member/adminLoginPage.do";
		}
		MemberVO memSession
		= (MemberVO)session.getAttribute("memSession");
		if(memSession == null){
			return "redirect:/admin/member/adminLoginPage.do";
		}
		else if(!memSession.getM_id().equals("admin")){
			return "redirect:/admin/member/adminLoginPage.do";
		}
		/************* 관리자 계정아닐시 로그인 페이지로 던짐 끝***************/
		
		//listData default nvl
		if(mvo.getOrderDirection() == null){
			mvo.setOrderDirection("desc");
		}
		if(mvo.getOrderTarget() == null){
			mvo.setOrderTarget("m_update");
		}
		
		Paging.setBookPaging(mvo);
		
		List<MemberVO> memberList = adminMemberService.memberList(mvo);
		//mvo.setSearchTotal(memberList.get(0).getSearchTotal());
		
		logger.info("searchTotal : "+mvo.getSearchTotal());
		logger.info("orderTarget : "+mvo.getOrderTarget());
		logger.info("orderDirection : "+mvo.getOrderDirection());
		
		model.addAttribute("memberList", memberList);
		model.addAttribute("listData", mvo);
		
		//siteLogService.siteLogUpdate(request, "bookList Move", "test");

		return "admin/member/memberList";
	}
	
	@RequestMapping(value="/adminLogin", method = RequestMethod.GET)
	public String adminLogin(@ModelAttribute MemberVO mvo, Model model, HttpServletRequest request, HttpSession session){
		logger.info("adminLogin Called");
		String resultData = ""; // SUCCESS 단어가 들어가있으면 성공으로 간주
		String resultMessage = ""; // ""으로 놔두면 alert 안 뜸
		String redirectURL = "/admin/sitelog/siteLogList.do";
		
		String id = mvo.getM_id();
		String pwd = mvo.getM_pwd();
		logger.info("고객이 입력한 id =" +id + " pwd = " + pwd );
		
		MemberVO memVO = new MemberVO();
		
		memVO = memberService.memberLogin(mvo);
		
		if(memVO!=null){
			if(memVO.getM_id().equals("admin")){
				session.setAttribute("memSession", memVO);
				resultData = "LOGIN SUCCESS";
				resultMessage = "";
				siteLogService.siteLogUpdate(request,"Login(Admin)","ID : "+memVO.getM_id());
			}
			else{
				resultData = "LOGIN FAILED";
				resultMessage = "관리자 계정이 아닙니다";
			}
		}else {
			resultData = "LOGIN FAILED";
			resultMessage = "아이디나 패스워드가 틀렸습니다";
			
		}
		
		model.addAttribute("resultData", resultData);
		model.addAttribute("resultMessage", resultMessage);
		model.addAttribute("redirectURL", redirectURL);
		
		return "common/resultPage";
	}
	
	@RequestMapping(value="/adminLoginPage", method = RequestMethod.GET)
	public String adminLoginPage(Model model){
		logger.info("adminLoginPage Called");
		return "admin/adminLoginPage";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/loginCheck")
	public String loginCheck(HttpSession session){
		logger.info("loginCheck Called");
		String result = "ERROR";
		
		MemberVO memSession = (MemberVO)session.getAttribute("memSession");
		if(memSession == null || memSession.getM_id().equals("")){
			logger.info("NoMember");
			result = "NoMember";
			
		}else{
			//Need Id Chk
			logger.info("YesMember");
			result = "YesMember";
			
		}

		return result;
	}

}
