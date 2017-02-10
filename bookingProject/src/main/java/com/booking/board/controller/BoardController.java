package com.booking.board.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.booking.board.service.BoardService;
import com.booking.board.vo.BoardVO;
import com.booking.board.vo.FaqVO;
import com.booking.common.paging.Paging;

@Controller
@RequestMapping(value="/board")
public class BoardController {
	Logger logger = Logger.getLogger(BoardController.class);
	
	@Autowired
	private BoardService boardService;
	
		
	/***********************************
	 * 게시판 목록 출력하기
	 * ***************************/
	@RequestMapping(value="/boardList.do")
	public String boardList(@ModelAttribute BoardVO bvo, Model model){
		logger.info("boardList 호출 성공");		
		
		//정렬에 대한 기본값 설정
		if(bvo.getOrderTarget()==null)bvo.setOrderTarget("bd_post_no");
		if(bvo.getOrderDirection()==null)bvo.setOrderDirection("DESC");
		
		
		//정렬에 대한 데이터 확인
		logger.info("orderTarget = " + bvo.getOrderTarget());
		logger.info("orderDirection = " + bvo.getOrderDirection());
		
		//검색에 대한 데이터 확인
		logger.info("searchMode ="+bvo.getSearchMode());
		logger.info("keyword ="+bvo.getKeyword());
		
		//날짜 검색에 대한 데이터 확인
		logger.info("searchStartDate ="+bvo.getSearchStartDate());
		logger.info("searchEndDate =" + bvo.getSearchEndDate());
		
		// 전체 레코드 수 구현
	      int total = boardService.boardListCnt(bvo);
	      logger.info("total = " + total);
	      bvo.setSearchTotal(total);
		
		//페이지 세팅
		Paging.setBookPaging(bvo);
		List<BoardVO> boardList = boardService.boardList(bvo);
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("data", bvo);
	
		
		
		return "board/boardList";
	}
	
	/***********************************
	 *개인정보 취급방침
	 * ***************************/
	@RequestMapping(value="/boardInfo.do")
	public String boardInfo(){
		logger.info("boardInfo 호출 성공");
		
		return "board/boardInfo";
	}
	/***********************************
	 *고객센터
	 * ***************************/
	@RequestMapping(value="/cusService.do")
	public String cusService(){
		logger.info("cusService 호출 성공");
		
		return "board/cusService";
	}
	
	/***********************************
	 *문의 게시판 출력
	 * ***************************/
	@RequestMapping(value="/questionBoardList.do")
	public String questionBoardList(){
		logger.info("questionBoardList 호출 성공");
		
		return "board/QuestionBoardList";
	}
	
	
	/***********************************
	 * 글쓰기 폼 출력하기
	 * ***************************/
	@RequestMapping(value="/boardInsertForm.do")
	public String boardInsertForm(){
		logger.info("boardInsertForm 호출 성공");
		
		return "board/boardInsertForm";
	}
	
	/***********************************
	 * 글쓰기 (첨부파일이 필요없는 게시판일때)
	 * ***************************/
	@RequestMapping(value="/boardInsert.do", method = RequestMethod.POST)
	public String boardInsert(@ModelAttribute BoardVO bvo){
		logger.info("boardInsert 호출 성공");
		
		int result = 0;
		String url = "";
		
		result = boardService.boardInsert(bvo);
		if(result == 1){
			url = "/board/boardList.do";
		}
		return "redirect:"+url;
	}
	
	/***********************************
	 * 글쓰기 (첨부파일이 필요한 게시판일때) : 아직 이미지 vo 안만들어서 이름 체크 할것!
	 * **************************
	@RequestMapping(value="/boardInsert.do")
	public String boardInsert(@ModelAttribute BoardVO bvo, HttpServletRequest request) throws IllegalStateException, IOException{
		logger.info("boardInsert 호출 성공");
		
		logger.info("fileName :" + bvo.getFile().getOriginalFilename());

			
		int result = 0;
		String url = "";
		
		String bd_file = FileUploadUtil.fileUpload(bvo.getFile(), request);
		bvo.setBd_file(bd_file);
		
		result = boardService.boardInsert(bvo);
		if(result == 1){
			url = "/board/boardList.do";
		}		
		
		return "redirect:"+url;
	}
	*/
	/****************************
	 * 게시글 상세보기
	 ***************************/
	@RequestMapping(value="/boardDetail", method = RequestMethod.GET)
	public String boardDetail(@ModelAttribute BoardVO bvo, Model model){
		logger.info("boardDetail 호출 성공");
		logger.info("bd_post_no : " + bvo.getBd_post_no());
		
		BoardVO detail = new BoardVO();
		detail = boardService.boardDetail(bvo);
		
		if(detail != null && (!detail.equals(""))){
			detail.setBd_content(detail.getBd_content().toString().replaceAll("\n", "<br>"));
		}
		model.addAttribute("detail", detail);
		
		return "board/boardDetail";
		
	}
	
	/****************************
	 * 비밀번호 확인
	 ***************************/	
	@ResponseBody
	@RequestMapping(value="/pwdConfirm.do", method=RequestMethod.POST)
		public String pwdConfirm(@ModelAttribute BoardVO bvo){
		logger.info("pwdConfirm 호출 성공");
		
		int result = 0;
		result = boardService.pwdConfirm(bvo);
		logger.info("result = "+result);
		
		return result+"";		
	}
	
	
	
	/*****************************
	    * 글수정 폼 출력하기
	    * @param : bd_post_num
	    * @return : BoardVO
	    *****************************/
	@RequestMapping(value="/boardUpdateForm.do")
		public String boardUpdateForm(@ModelAttribute BoardVO bvo, Model model){
		logger.info("boardUpdateForm 호출 성공");
		logger.info("bd_post_no:"+bvo.getBd_post_no());
		
		BoardVO updateData = new BoardVO();
		updateData = boardService.boardDetail(bvo);
		
		model.addAttribute("updateData", updateData);
		
		return "board/boardUpdateForm";
	}
	
	
	/**********************************
	 * 글 수정하기 -- (첨부파일 없을때)
	 * *********************************/
	@RequestMapping(value="/boardUpdate.do", method=RequestMethod.POST)
		public String boardUpdate(@ModelAttribute BoardVO bvo){
		logger.info("boardUpdate 호출 성공");
		
		int result = 0;
		String url = "";
		
		result = boardService.boardUpdate(bvo);
		logger.info("result:"+result);
		if(result == 1){
			url = "/board/boardDetail.do?bd_post_no="+bvo.getBd_post_no();
			
		}
		
		return "redirect:"+url;
	}
	
	/**********************************
	 * 글 수정하기 -- (첨부파일 있을때)
	 * ********************************
	@RequestMapping(value="/boardUpdate.do", method=RequestMethod.POST)
		public String boardUpdate(@ModelAttribute BoardVO bvo, HttpServletRequest request) throws IllegalStateException, IOException{
		logger.info("boardUpdate 호출 성공");
		
		int result = 0;
		String url = "";
		String bd_file = "";
		
		if(!bvo.getFile().isEmpty()){	//첨부파일을 새로 받아올때
			logger.info(" ===== bd_file =" + bvo.getBd_file());
			FileUploadUtil.fileDelete(bvo.getBd_file(), request);
			bd_file = FileUploadUtil.fileUpload(bvo.getFile(), request);
			bvo.setBd_file(bd_file);
						
		}else{		//기존 파일을 새로 쓸때
			logger.info("첨부파일 없음");
			bvo.setBd_file("");
		}
		
		logger.info("=====bd_file = "+ bvo.getBd_file());
		result = boardService.boardUpdate(bvo);
		if(result == 1){
			url = "/board/boardDetail.do?bd_post_no="+bvo.getBd_post_no();
			
		}
		
		return "redirect:"+url;
	}
	*/
	
	
	/***********************************
	 * 답변쓰기 
	 * ***************************/
	@RequestMapping(value="/boardReplyInsert.do", method = RequestMethod.POST)
	public String boardReplyInsert(@ModelAttribute BoardVO bvo, Model model){
		logger.info("boardReplyInsert 호출 성공");
		
		int result = 0;
		String url = "";
				
		result = boardService.boardInsert(bvo);
		if(result == 1){
			url = "/board/boardList.do";
		}
		
		
		return "redirect:"+url;
	}
	
	
	/****************************
	 * 글 삭제하기
	 ***************************	*/
	@RequestMapping(value="/boardDelete.do")
	public String boardDelete(@ModelAttribute BoardVO bvo){
		logger.info("boardDelete 호출 성공");
		
		int result = 0;
		String url = "";
		
		result = boardService.boardDelete(bvo.getBd_post_no());
		if(result == 1){
			url = "/board/boardList.do";
		}
		
		return "redirect:"+url;
	}
	
	/*********************************
	 * FAQ 목록 출력하기
	 ********************************/
	@RequestMapping(value="/boardFAQList.do")
	public String boardFAQList(Model model){
		logger.info("faqList hello");
		
		List<FaqVO> faqList = boardService.faqList();
		
		logger.info("faqList size = "+faqList.size());
		logger.info(faqList.toString());
		model.addAttribute("faqList", faqList);
		return "board/boardFAQList";
	}
	
	/*********************************
	 * FAQ Detail 출력하기
	 ********************************/
	@RequestMapping(value="/boardFAQDetail.do")
	public String boardFAQDetail(){
		return "board/boardFAQDetail";
	}
	
	
	
	
}

