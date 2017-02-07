package com.booking.reply.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.booking.reply.service.ReplyService;
import com.booking.reply.vo.ReplyVO;

@RestController
@RequestMapping(value="/replies")
public class ReplyController {
	Logger logger = Logger.getLogger(ReplyController.class);

	@Autowired
	private ReplyService replyService;
	
	/***************************************
	 * 댓글 글 목록 구현하기
	 * @return List<ReplyVO>
	 * 참고 : @PathVariable는 URI의 경로에서 원하는 데이터를 추출하는 용도의 어노테이션
	 * 현재 요청 url : http://localhost:8080/replies/all/게시판글번호.do
	 * 예전 요청 url(mvcProject) : http://localhost:8080/replies/replyList.do?b_num=게시판 글번호
	 ****************************************/
	@RequestMapping(value="/all/{bd_post_no}.do", method=RequestMethod.GET)
	public ResponseEntity<List<ReplyVO>>list(@PathVariable("bd_post_no") Integer bd_post_no){
		
		ResponseEntity<List<ReplyVO>> entity = null;
		ReplyVO rvo = new ReplyVO();
		logger.info("re_update_time:");
		try{
			entity = new ResponseEntity<>(replyService.replyList(bd_post_no), HttpStatus.OK);
			
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
			return entity;
	}
	
	/***************************************
	 * 댓글 쓰기
	 **************************************/
	@RequestMapping(value="/replyInsert.do",method=RequestMethod.POST)
	public ResponseEntity<String> replyInsert(@RequestBody ReplyVO rvo){
		logger.info("replyInsert 호출 성공");
		ResponseEntity<String> entity = null;
		int result;
		try{
			result = replyService.replyInsert(rvo);
			
			if(result == 1){
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			}
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		
	}
	
	/***************************************
	 * 댓글 수정
	 **************************************/
	@RequestMapping(value="/{re_no}.do", method = RequestMethod.PUT)
	public ResponseEntity<String> replyUpdate(@PathVariable("re_no") Integer re_no, @RequestBody ReplyVO rvo){
		logger.info("replyUpdate 호출 성공");
		ResponseEntity<String> entity = null;
		try{
			rvo.setRe_no(re_no);
			replyService.replyUpdate(rvo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	/***************************************
	 * 댓글 삭제
	 **************************************/
	@RequestMapping(value="/{re_no}.do", method = RequestMethod.DELETE)
	public ResponseEntity<String> replyUpdate(@PathVariable("re_no") Integer re_no){
		logger.info("replyDelete 호출 성공");
		ResponseEntity<String> entity = null;
		try{
			replyService.replyDelete(re_no);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	/***************************************
	 * 비밀번호 체크
	 **************************************/
	@RequestMapping(value="/pwdConfirm.do", method= RequestMethod.POST)
	public ResponseEntity<Integer> pwdConfirm(@ModelAttribute ReplyVO rvo){
		logger.info("pwdConfirm 호출 성공");
		ResponseEntity<Integer> entity = null;
		
		int result = 0;
		try{
			result = replyService.pwdConfirm(rvo);
			entity = new ResponseEntity<Integer>(result, HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<Integer>(result, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
