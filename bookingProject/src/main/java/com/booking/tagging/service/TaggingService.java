package com.booking.tagging.service;

import java.util.List;

import com.booking.tagging.vo.TaggingVO;

public interface TaggingService {
	
	public List<TaggingVO> tagList(String isbn);
	
	public int insertTag(TaggingVO tagvo);
	
	public int insertTagLink(TaggingVO tagvo);
	
	public int tagScoreUp(TaggingVO tagvo);
	
	public int tagScoreDown(TaggingVO tagvo);
}
