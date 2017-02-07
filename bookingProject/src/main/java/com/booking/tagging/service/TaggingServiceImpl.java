package com.booking.tagging.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.booking.tagging.dao.TaggingDAO;
import com.booking.tagging.vo.TaggingVO;

@Service
@Transactional
public class TaggingServiceImpl implements TaggingService{

	@Autowired
	private TaggingDAO taggingDAO;
	
	@Override
	public List<TaggingVO> tagList(String isbn) {

		List<TaggingVO> tagList = taggingDAO.tagList(isbn);
		return tagList;
	}

	@Override
	public int insertTag(TaggingVO tagvo) {
		int success = 0;
		
		TaggingVO getTag = taggingDAO.checkTag(tagvo);
		
		// 기존에 존재하는 태그가 없음 => 등록
		if(getTag == null){
			success = taggingDAO.insertTag(tagvo);
		}
		return success;
	}

	@Override
	public int insertTagLink(TaggingVO tagvo) {
		int success = 0;
		
		TaggingVO getTag = taggingDAO.checkTagLink(tagvo);
		
		// 태그 연결이 존재하지 않음 -> 연결 생성
		if(getTag == null){
			success = taggingDAO.insertTagLink(tagvo);
		}
		// 이미 태그 연결이 존재함 -> 기존의 태그 스코어 +1
		else{
			success = tagScoreUp(tagvo);
		}
		
		return success;
	}

	@Override
	public int tagScoreUp(TaggingVO tagvo) {
		return taggingDAO.tagScoreUp(tagvo);
	}

	@Override
	public int tagScoreDown(TaggingVO tagvo) {
		return taggingDAO.tagScoreDown(tagvo);
	}

}
