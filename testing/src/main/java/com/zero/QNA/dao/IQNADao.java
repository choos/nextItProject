package com.zero.QNA.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.zero.QNA.vo.QNAVO;

@Mapper
public interface IQNADao {
	
	/**
	 * QNA게시판 조회
	 * @param faCategory
	 * @return QNA목록
	 * @throws SQLException
	 */
	public List<QNAVO> getQNACategory(String faCategory) throws SQLException;
	
	/**
	 * QNA게시판 카테고리 조회
	 * @return QNA목록
	 * @throws SQLException
	 */
	public List<QNAVO> getQNAList() throws SQLException
	;
	/**
	 * QNA뷰 불러오기
	 * @param qNum
	 * @return UserVO
	 * @throws SQLException
	 */
	public QNAVO getQNA(int qNum) throws SQLException;
	
	/**
	 * QNA등록
	 * @param qanVO
	 * @return
	 * @throws SQLException
	 */
	public int insertQNARegist(QNAVO qanVO) throws SQLException;
	
	/**
	 * QNA 수정
	 * @param qanVO
	 * @return
	 * @throws SQLException
	 */
	public int updateQNA(QNAVO qanVO) throws SQLException;
	
	/**
	 * QNA삭제
	 * "Y"로 변경
	 * @param qanVO
	 * @return
	 * @throws SQLException
	 */
	public int deleteQNA(int qNum) throws SQLException;
	
	/**
	 * 관리자 게시판
	 * @return
	 * @throws SQLException
	 */
	//public List<QNAVO> getOTOList() throws SQLException;
	
	/**
	 * QNA 답글
	 * @return qanVO
	 * @throws SQLException
	 */
	public QNAVO OTOAnswer(int qNum) throws SQLException;
	
	/**
	 * 사용자 답글여부 NY
	 * @param qNum
	 * @return
	 * @throws SQLException
	 */
	public int AnsweNY(int qNum) throws SQLException;
	
	/**
	 * 답글작성
	 * @param otoVO
	 * @throws SQLException
	 */
	public int insertOTO(QNAVO otoVO) throws SQLException;
    
	/**
	 * 답글수정
	 * @param otoVO
	 * @return 
	 * @throws SQLException
	 */
	public int updateOTO(QNAVO otoVO) throws SQLException;
	
}
