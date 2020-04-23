package com.zero.shoppingCart.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.zero.shoppingCart.vo.CartVO;

@Mapper
public interface ICartDao {
	
	public List<CartVO> getCartList(CartVO list) throws SQLException;

	public int insertCart(CartVO list) throws SQLException;
	
	public int updateCart(CartVO list) throws SQLException;
	
	public int deleteCart(CartVO list) throws SQLException;
}
