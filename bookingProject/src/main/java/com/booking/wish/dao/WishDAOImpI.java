package com.booking.wish.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.booking.wish.vo.WishVO;

@Repository
public class WishDAOImpI implements WishDAO {

		@Autowired
		public SqlSession session;

		@Override
		public List<WishVO> wishList(WishVO wvo) {
			// TODO Auto-generated method stub
			return session.selectList("wishList");
		}

		@Override
		public int wishInsert(WishVO wvo) {
			// TODO Auto-generated method stub
			return (int)session.insert("wishInsert");
		}

		@Override
		public int searchM_no(String id) {
			// TODO Auto-generated method stub
			return (Integer)session.selectOne("searchM_no",id);
		}

		@Override
		public int isbnNumberCheck(WishVO wvo) {
			// TODO Auto-generated method stub
			return (Integer)session.selectOne("isbnNumberCheck");
		}

		@Override
		public int wishDelete(WishVO wvo) {
			// TODO Auto-generated method stub
			return (Integer)session.delete("wishDelete");
		}
}
