package com.booking.admin.book.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.booking.admin.book.dao.AdminBookDAO;
import com.booking.admin.book.vo.BookReleaseVO;
import com.booking.admin.book.vo.BookStockVO;
import com.booking.book.vo.BookVO;

@Service
@Transactional
public class AdminBookServiceImpl implements AdminBookService{
	
	
	@Autowired
	private AdminBookDAO adminBookDAO;
	
	@Autowired
	private CategoryService categoryService;
	
	@Override
	public List<BookStockVO> bookStockList(BookStockVO bsvo){
		List<BookStockVO> bookStockList = adminBookDAO.bookStockList(bsvo);
		if(bookStockList.size() > 0){
			bookStockList.get(0).setSearchTotal(adminBookDAO.bookStockTotal(bsvo));
		}
		return bookStockList;
	}
	@Override
	public int bookStockInsert(BookStockVO bsvo){
		int success = adminBookDAO.bookStockInsert(bsvo);
		if(success == 1){
			success = adminBookDAO.bookStockIn(bsvo);
		}
		return success;
	}
	
	@Override
	public List<BookReleaseVO> bookReleaseList(BookReleaseVO brvo){
		List<BookReleaseVO> bookReleaseList = adminBookDAO.bookReleaseList(brvo);
		if(bookReleaseList.size() > 0){
			bookReleaseList.get(0).setSearchTotal(adminBookDAO.bookReleaseTotal(brvo));
		}
		return bookReleaseList;
	}
	@Override
	public int bookReleaseInsert(BookReleaseVO brvo){
		int success = adminBookDAO.bookReleaseInsert(brvo);
		if(success == 1){
			success = adminBookDAO.bookReleaseOut(brvo);
		}
		return success;
	}
	
	@Override
	public List<BookVO> bookList(BookVO bvo){
		List<BookVO> bookList = adminBookDAO.bookList(bvo);
		if(bookList.size() > 0){
			bookList.get(0).setSearchTotal(adminBookDAO.bookSearchTotal(bvo));
			for(BookVO item : bookList){
				item.setCat_name(categoryService.categoryLongName(item));
			}
		}
		
		return bookList;
	}
	
	@Override
	public int bookSearchTotal(BookVO bvo){
		return adminBookDAO.bookSearchTotal(bvo);
	}
	@Override
	public String isbnCheck(String isbn){
		return adminBookDAO.isbnCheck(isbn);
	}
	@Override
	public BookVO bookSelect(String isbn){
		return adminBookDAO.bookSelect(isbn);
	}
	@Override
	public int bookInsert(BookVO bvo){
		return adminBookDAO.bookInsert(bvo);
	}
	@Override
	public int bookUpdate(BookVO bvo){
		return adminBookDAO.bookUpdate(bvo);
	}
}
