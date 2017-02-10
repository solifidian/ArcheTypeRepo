package com.booking.admin.purchase.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.booking.book.vo.Purchase_DeliveryVO;
import com.booking.common.paging.Paging;
import com.booking.member.service.MemberService;
import com.booking.member.vo.MemberVO;

@Controller
@RequestMapping(value="/admin/purchase")
public class AdminPurchaseController {
	Logger logger = Logger.getLogger(AdminPurchaseController.class);
	
	@Autowired
	private MemberService memberService;
	
	
	// 마이페이지로 이동
	@RequestMapping(value="/purchaseList.do")
	public String memberMypage(@ModelAttribute Purchase_DeliveryVO listVO, Model model, HttpServletRequest request){
		logger.info("memberMypage 호출 성공");
		
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
		
		/* *******************************
		 * session으로부터 M_no 전달.
		 * null이면 0으로 반환
		 * */
		//listData default nvl
		listVO.setOrderDirection("desc");
		listVO.setOrderTarget("p_no");
		
		Paging.setBookPaging(listVO);
		
		/*********************
		 * 선택 되지 않은 List는 null값만 jsp페이지로 보내게 됨
		 ********************/
		List<Purchase_DeliveryVO> pvoList = null;
		pvoList = memberService.myPurchase(listVO);
		
		listVO.setSearchTotal(memberService.myPurchaseCnt(listVO));
		

				
		model.addAttribute("purchaseList", pvoList);
		model.addAttribute("listData", listVO);
		
		
		return "admin/purchase/purchaseList";
	}
}
