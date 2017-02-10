package com.booking.admin.book.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.booking.admin.book.dao.CategoryDAO;
import com.booking.book.vo.BookVO;
import com.booking.book.vo.CategoryVO;

@Service
@Transactional
public class CategoryServiceImpl implements CategoryService{

	@Autowired
	private CategoryDAO categoryDAO;
	
	@Override
	public List<CategoryVO> categoryList(int cat_no){
		return categoryDAO.categoryList(cat_no); 
	}
	@Override
	public CategoryVO categoryOne(int cat_no){
		CategoryVO ctvo = categoryDAO.categorySelectOne(cat_no);
		return categoryDAO.categorySelectToParent(ctvo);
	}
	@Override
	public List<CategoryVO> categorySelectList(int cat_no){
		return categoryDAO.categorySelectList(cat_no);
	}
	@Override
	public List<CategoryVO> categoryBoxList(CategoryVO ctvo){
		return categoryDAO.categoryBoxList(ctvo);
	}
	@Override
	public String categoryName(BookVO bvo){
		String cateStr = "NONE";
		CategoryVO ctvo = new CategoryVO();
		if(bvo.getCat_no() >= 1){
			ctvo = categoryOne(bvo.getCat_no());
			if(ctvo.getLc2() != null){
				cateStr = ctvo.getLc2();
			}
			else if(ctvo.getLc() != null){
				cateStr = ctvo.getLc();
			}
			else if(ctvo.getMc() != null){
				cateStr = ctvo.getMc();
			}
			else if(ctvo.getHc() != null){
				cateStr = ctvo.getHc();
			}
			else{
				cateStr = "NONE";
			}
		}
		
		return cateStr;
	}
	@Override
	public String categoryLongName(BookVO bvo){
		String cateStr = "";
		CategoryVO ctvo = new CategoryVO();
		if(bvo.getCat_no() >= 1){
			ctvo = categoryOne(bvo.getCat_no());
			if(ctvo != null){
				if(ctvo.getHc() != null){
					cateStr += ctvo.getHc();
					
					if(ctvo.getMc() != null){
						cateStr += " > "+ctvo.getMc();
						
						if(ctvo.getLc() != null){
							cateStr += " > "+ctvo.getLc();
							
							if(ctvo.getLc2() != null){
								cateStr += " > "+ctvo.getLc2();
							}
						}
					}
				}

			}
			else{
				cateStr = "NONE";
			}
			
		}
		return cateStr;
	}
}
