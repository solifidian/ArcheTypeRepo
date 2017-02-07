package com.booking.wish.dao;

import java.util.List;

import com.booking.wish.vo.WishVO;

public interface WishDAO {

	public List<WishVO> wishList(WishVO wvo);
	public int wishInsert(WishVO wvo);
	public int wishDelete(WishVO wvo);
	
	
	public int searchM_no(String id);
	public int isbnNumberCheck(WishVO wvo);

}
