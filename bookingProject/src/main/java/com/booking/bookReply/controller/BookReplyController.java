package com.booking.bookReply.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.booking.bookReply.service.BookReplyService;
import com.booking.bookReply.vo.BookReplyVO;

@RestController
@RequestMapping(value="/bookReplies")
public class BookReplyController {
	Logger logger = Logger.getLogger(BookReplyController.class);

	@Autowired
	private BookReplyService bookReplyService;
	
	/***************************************
	 * 댓글 글 목록 구현하기
	 * @return List<BookReplyVO>
	 * 참고 : @PathVariable는 URI의 경로에서 원하는 데이터를 추출하는 용도의 어노테이션
		 ****************************************/
	@RequestMapping(value="/br/{isbn}.do", method=RequestMethod.GET)
	public ResponseEntity<List<BookReplyVO>>list(@PathVariable("isbn") String isbn){
	
		ResponseEntity<List<BookReplyVO>> entity = null;
		BookReplyVO brvo = new BookReplyVO();
		
		logger.info("br_update_time:");
	
		try{
			entity = new ResponseEntity<>(bookReplyService.bReplyList(isbn), HttpStatus.OK);
		
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	/***************************************
	 * 댓글 쓰기
	 **************************************/
	@RequestMapping(value="bReplyInsert.do", method = RequestMethod.POST)
	public ResponseEntity<String> bReplyInsert(@RequestBody BookReplyVO brvo){
		logger.info("bReplyInsert 호출 성공");
		ResponseEntity<String> entity = null;
		
		int result;
		try{
			result = bookReplyService.bReplyInsert(brvo);
			
			if(result == 1){
				entity = new ResponseEntity<String>("SUCCESS" ,HttpStatus.OK);
			}
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}

	/***************************************
	 * 댓글 수정
	 **************************************/
	@RequestMapping(value="/{br_no}.do", method= RequestMethod.PUT)
	public ResponseEntity<String> bReplyUpdate(@PathVariable("br_no") Integer br_no, @RequestBody BookReplyVO brvo){
		logger.info("bReplyUpdate 호출 성공");
		logger.info("br_score:"+brvo.getBr_score());
		ResponseEntity<String> entity = null;
		
		try{
			brvo.setBr_no(br_no);
			bookReplyService.bReplyUpdate(brvo);
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
	@RequestMapping(value="/{br_no}.do", method= RequestMethod.DELETE)
	public ResponseEntity<String> bReplyDelete(@PathVariable("br_no") Integer br_no){
		logger.info("bReplyDelete 호출 성공");
		ResponseEntity<String> entity = null;
		
		try{
			bookReplyService.bReplyDelete(br_no);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
}
