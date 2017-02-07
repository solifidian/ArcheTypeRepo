package com.booking.tagging.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.booking.tagging.vo.TaggingVO;

@Repository
public class TaggingDAOImpl implements TaggingDAO{

	@Autowired
	private SqlSession session;
	
	@Override
	public List<TaggingVO> tagList(String isbn) {
		return session.selectList("tagList",isbn);
	}

	@Override
	public TaggingVO checkTag(TaggingVO tagvo) {
		return session.selectOne("checkTag",tagvo);
	}

	@Override
	public TaggingVO checkTagLink(TaggingVO tagvo) {
		return session.selectOne("checkTag",tagvo);
	}

	@Override
	public int insertTag(TaggingVO tagvo) {
		return session.insert("insertTag",tagvo);
	}

	@Override
	public int insertTagLink(TaggingVO tagvo) {
		return session.insert("insertTagLink",tagvo);
	}

	@Override
	public int tagScoreUp(TaggingVO tagvo) {
		return session.update("tagScoreUp",tagvo);
	}

	@Override
	public int tagScoreDown(TaggingVO tagvo) {
		return session.update("tagScoreDown",tagvo);
	}

}
