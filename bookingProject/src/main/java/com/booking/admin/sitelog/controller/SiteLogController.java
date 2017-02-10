package com.booking.admin.sitelog.controller;

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

import com.booking.admin.sitelog.service.SiteLogService;
import com.booking.admin.sitelog.vo.SiteLogVO;
import com.booking.common.paging.Paging;
import com.booking.member.vo.MemberVO;

@Controller
@RequestMapping(value = "admin/sitelog")
public class SiteLogController {
	Logger logger = Logger.getLogger(SiteLogController.class);
	
	
	@Autowired
	private SiteLogService siteLogService;
	
	@RequestMapping(value = "/siteLogList", method = RequestMethod.GET)
	public String siteLogList(@ModelAttribute SiteLogVO slvo, Model model, HttpServletRequest request){
		logger.info("siteLogList Called");
		
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
		if(slvo.getOrderDirection() == null){
			slvo.setOrderDirection("desc");
		}
		if(slvo.getOrderTarget() == null){
			slvo.setOrderTarget("log_no");
		}
		
		Paging.setBookPaging(slvo);
		
		List<SiteLogVO> siteLogList = siteLogService.siteLogList(slvo);
		slvo.setSearchTotal(siteLogList.get(0).getSearchTotal());
		
		logger.info("searchTotal : "+slvo.getSearchTotal());
		logger.info("orderTarget : "+slvo.getOrderTarget());
		logger.info("orderDirection : "+slvo.getOrderDirection());
		
		model.addAttribute("siteLogList", siteLogList);
		model.addAttribute("listData", slvo);
		
		return "admin/sitelog/siteLogList";
	}
	
	@RequestMapping(value = "/siteLogInsert", method = RequestMethod.POST)
	public String siteLogInsert(HttpServletRequest request, Model model){
		logger.info("siteLogInsert Called");
		String log_ip = request.getRemoteAddr();
		

		
		
		
		
		logger.info("siteLog ip : "+log_ip);
		String log_title = request.getParameter("log_title");
		String log_comment = request.getParameter("log_comment");
		
		SiteLogVO slvo = new SiteLogVO();
		slvo.setLog_ip(log_ip);
		slvo.setLog_title(log_title);
		slvo.setLog_comment(log_comment);
		
		siteLogService.siteLogInsert(slvo);
		
		return "common/returnPage";
	}
}
