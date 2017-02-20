package com.booking.common.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.booking.admin.book.service.CategoryService;
import com.booking.book.vo.CategoryVO;

@Controller
@RequestMapping(value="/common")
public class CategoryController {

	Logger logger = Logger.getLogger(CategoryController.class);
	
	@Autowired
	CategoryService categoryService;
	
	@ResponseBody
	@RequestMapping(value="/categoryBoxList")
	public List<CategoryVO> categoryBoxList(@RequestParam int cat_step, @RequestParam int cat_root){
		List<CategoryVO> ctvoList = null;
		
		CategoryVO ctvo = new CategoryVO();
		ctvo.setCat_step(cat_step);
		ctvo.setCat_root(cat_root);
		
		ctvoList = categoryService.categoryBoxList(ctvo);
		
		return ctvoList;
	}
	
	@ResponseBody
	@RequestMapping(value="/categoryOne")
	public CategoryVO categoryOne(@RequestParam int cat_no){
		CategoryVO ctvo = null;
		
		ctvo = categoryService.categoryOne(cat_no);
		ctvo.setCat_no(cat_no);
		
		return ctvo;
	}
	
	@RequestMapping(value="/categoryListPanel")
	public String categoryBoxPanel(@ModelAttribute CategoryVO ctvo, Model model){
		List<CategoryVO> ctvoList = categoryService.categoryBoxList(ctvo);
		
		model.addAttribute("cateList",ctvoList);
		
		return "book/bookCategoryLink";
	}
}
