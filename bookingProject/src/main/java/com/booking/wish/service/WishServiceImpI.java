package com.booking.wish.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.booking.wish.dao.WishDAO;
import com.booking.wish.vo.WishVO;

@Service
@Transactional
public class WishServiceImpI implements WishService{
 
	@Autowired
	public WishDAO wishDAO;

	@Override
	public List<WishVO> wishList(WishVO wvo) {
		// TODO Auto-generated method stub
		List<WishVO> list=wishDAO.wishList(wvo);
		
		return list;
	}

	@Override
	public int wishInsert(WishVO wvo) {
		// TODO Auto-generated method stub
		return wishDAO.wishInsert(wvo);
	}

	@Override
	public int searchM_no(String id) {
		// TODO Auto-generated method stub
		return wishDAO.searchM_no(id);
	}

	@Override
	public int isbnNumberCheck(WishVO wvo) {
		// TODO Auto-generated method stub
		return wishDAO.isbnNumberCheck(wvo);
	}

	@Override
	public int wishDelete(WishVO wvo) {
		// TODO Auto-generated method stub
		return wishDAO.wishDelete(wvo);
	}
	
	
	
}
