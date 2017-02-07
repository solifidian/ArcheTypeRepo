package com.booking.tagging.dao;

import java.util.List;

import com.booking.tagging.vo.TaggingVO;

public interface TaggingDAO {

	public List<TaggingVO> tagList(String isbn);
	
	public TaggingVO checkTag(TaggingVO tagvo);
	
	public TaggingVO checkTagLink(TaggingVO tagvo);
	
	public int insertTag(TaggingVO tagvo);
	
	public int insertTagLink(TaggingVO tagvo);
	
	public int tagScoreUp(TaggingVO tagvo);
	
	public int tagScoreDown(TaggingVO tagvo);
}
