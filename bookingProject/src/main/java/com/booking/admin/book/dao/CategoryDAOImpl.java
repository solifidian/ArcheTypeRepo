package com.booking.admin.book.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.booking.book.vo.CategoryVO;

@Repository
public class CategoryDAOImpl implements CategoryDAO{
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<CategoryVO> categoryList(int cat_no){
		return session.selectList("categoryList",cat_no);
	}
	@Override
	public CategoryVO categorySelectOne(int cat_no){
		return session.selectOne("categoryList",cat_no);
	}
	@Override
	public List<CategoryVO> categorySelectList(int cat_no){
		return session.selectList("categoryList",cat_no);
	}
	@Override
	public List<CategoryVO> categoryBoxList(CategoryVO ctvo){
		return session.selectList("categoryBoxList",ctvo);
	}
}
