package com.zero.shoppingCart.service;

import java.sql.SQLException;
import java.util.List;

import com.zero.shoppingCart.vo.CartVO;

public interface ICartService {

	
	public List<CartVO> getCartList(CartVO list) throws SQLException;
	
	public void insertList(CartVO list) throws SQLException;
	
	public void updateList(CartVO list) throws SQLException;

	public void removeList(CartVO list) throws SQLException;

}
