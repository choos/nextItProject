package com.zero.shoppingCart.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zero.shoppingCart.dao.ICartDao;
import com.zero.shoppingCart.vo.CartVO;

@Service
public class CartServiceImpl implements ICartService {
	
	@Autowired
	ICartDao cartDao;
	
	
	@Override
	public List<CartVO> getCartList(CartVO list) throws SQLException {
		
		return cartDao.getCartList(list);
	}

	@Override
	public void insertList(CartVO list) throws SQLException {
		cartDao.insertCart(list);
	}

	@Override
	public void updateList(CartVO list) throws SQLException {
		cartDao.updateCart(list);
	}

	@Override
	public void removeList(CartVO list) throws SQLException {
		cartDao.deleteCart(list);
	}



	
	
	
}
