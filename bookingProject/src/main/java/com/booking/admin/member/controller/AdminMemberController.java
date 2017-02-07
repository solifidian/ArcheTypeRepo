package com.booking.admin.member.controller;

import java.net.HttpCookie;
import java.util.List;

import javax.servlet.http.Cookie;
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
import com.booking.common.paging.Paging;
import com.booking.member.vo.MemberVO;

@Controller
@RequestMapping(value="admin/member")
public class AdminMemberController {
	Logger logger = Logger.getLogger(AdminMemberController.class);
	
	
	@Autowired
	private AdminMemberService adminMemberService;
	
	
	@RequestMapping(value="/memberList", method = RequestMethod.GET)
	public String bookList(@ModelAttribute MemberVO mvo, Model model, HttpServletRequest request){
		logger.info("memberList Called");
		
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
