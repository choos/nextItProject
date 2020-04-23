package com.zero.ufboard.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.zero.common.exception.BizException;
import com.zero.ufboard.vo.UFBoardVO;
import com.zero.ufboard.vo.UFSearchVO;

public interface IUFBoardService {


	public List<UFBoardVO> getBoardList(UFSearchVO searchVO) throws BizException;

	public UFBoardVO getBoard(String ufCode) throws BizException;
	
	public void registBoard(UFBoardVO board) throws BizException;
	
	public void updateBoard(UFBoardVO board) throws BizException;
	
	public void recommend(String ufCode) throws Exception;  //추천하기 메소드
	
	public int deleteBoard(UFBoardVO board) throws SQLException;
	
	public void insertLike(UFBoardVO userLike) throws Exception;  //추천하기 메소드
	
	public int checkLike(UFBoardVO userCheckLike) throws Exception;  

	public void write(UFBoardVO board, MultipartHttpServletRequest mpRequest) throws Exception;
}