package com.booking.tagging.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.booking.tagging.service.TaggingService;
import com.booking.tagging.vo.TaggingVO;

@RestController
@RequestMapping(value="/tagging")
public class TaggingController {

	Logger logger = Logger.getLogger(TaggingController.class);
	
	@Autowired
	private TaggingService taggingService;
	
	@RequestMapping(value="/tagList", method = RequestMethod.GET)
	public ResponseEntity<List<TaggingVO>> tagList(@RequestParam String isbn){
		logger.info("tagList Called");
		
		ResponseEntity<List<TaggingVO>> entity = null;
		
		try{
			entity = new ResponseEntity<List<TaggingVO>>(taggingService.tagList(isbn), HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		// 성공시 "SUCCESS" 반환
		return entity;
	}
	
	@RequestMapping(value="/insertTagLink", method = RequestMethod.GET)
	public ResponseEntity<String> insertTagLink(@RequestBody TaggingVO tagvo){
		logger.info("insertTagLink Called");
		
		ResponseEntity<String> entity = null;
		
		int success = 0;

		// 태그가 존재하지 않을 경우 태그 추가
		taggingService.insertTag(tagvo);
		
		try{
			//태그 연결이 없으면 태그 링크 생성, 있으면 tagScoreUp과 똑같은 효과
			success = taggingService.insertTagLink(tagvo);
			if(success == 1){
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			}
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		
		// 성공시 "SUCCESS" 반환
		return entity;
	}
	
	@RequestMapping(value="/tagScoreUp", method = RequestMethod.GET)
	public ResponseEntity<String> tagScoreUp(@RequestBody TaggingVO tagvo){
		logger.info("tagScoreUp Called");
		
		ResponseEntity<String> entity = null;
		
		int success = 0;
		
		try{
			success = taggingService.tagScoreUp(tagvo);
			if(success == 1){
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			}
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		
		// 성공시 "SUCCESS" 반환
		return entity;
	}
	
	@RequestMapping(value="/tagScoreDown", method = RequestMethod.GET)
	public ResponseEntity<String> tagScoreDown(@RequestBody TaggingVO tagvo){
		logger.info("tagSocreDown Called");
		
		ResponseEntity<String> entity = null;
		
		int success = 0;
		
		try{
			success = taggingService.tagScoreDown(tagvo);
			if(success == 1){
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			}
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		
		// 성공시 "SUCCESS" 반환
		return entity;
	}
}
