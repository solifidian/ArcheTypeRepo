package com.booking.admin.book.dao;

import java.util.List;

import com.booking.book.vo.CategoryVO;

public interface CategoryDAO {

	public List<CategoryVO> categoryList(int cat_no);
	
	public CategoryVO categorySelectOne(int cat_no);
	
	public List<CategoryVO> categorySelectList(int cat_no);
	
	public List<CategoryVO> categoryBoxList(CategoryVO ctvo);
	
	public CategoryVO categorySelectToParent(CategoryVO ctvo);
}
