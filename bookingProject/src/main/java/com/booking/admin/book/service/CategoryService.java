package com.booking.admin.book.service;

import java.util.List;

import com.booking.book.vo.BookVO;
import com.booking.book.vo.CategoryVO;

public interface CategoryService {
	
	public List<CategoryVO> categoryList(int cat_no);
	
	public CategoryVO categoryOne(int cat_no);
	
	public List<CategoryVO> categorySelectList(int cat_no);
	
	public List<CategoryVO> categoryBoxList(CategoryVO ctvo);
	
	public String categoryName(BookVO bvo);
	
	public String categoryLongName(BookVO bvo);
	
	
}
