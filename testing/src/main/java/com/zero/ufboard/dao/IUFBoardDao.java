package com.zero.ufboard.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.zero.common.exception.BizException;
import com.zero.ufboard.vo.UFBoardVO;
import com.zero.ufboard.vo.UFSearchVO;

@Mapper
public interface IUFBoardDao {
	
	public int getBoardCount(UFSearchVO searchVO) throws BizException;
	
	public List<UFBoardVO> getBoardList(UFSearchVO searchVO) throws SQLException;

	public UFBoardVO getBoard(String ufCode) throws  SQLException;
	
	public void recommend(String ufCode) throws Exception;  //異붿쿇�븯湲� 硫붿냼�뱶
	
	public void insertLike(UFBoardVO userLike) throws Exception;  //異붿쿇�븯湲� �벑濡� 硫붿냼�뱶
	
	public int checkLike(UFBoardVO userCheckLike) throws Exception;
	
	public int insertBoard(UFBoardVO board) throws BizException;
	
	public int updateBoard(UFBoardVO board) throws SQLException;
	
	public int deleteBoard(UFBoardVO board) throws SQLException;
	
	public void insertFile(Map<String, Object> map) throws Exception;
	
}