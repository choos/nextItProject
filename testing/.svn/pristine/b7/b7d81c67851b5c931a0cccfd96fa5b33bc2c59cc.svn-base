package com.zero.FAQ.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.zero.FAQ.vo.FAQVO;

@Mapper
public interface IFAQDao {
	
	/**
	 * FAQ 카테고리
	 * @param faCategory
	 * @return
	 * @throws SQLException
	 */
	public List<FAQVO> getFAQCategory(String faCategory) throws SQLException;

	/**
	 * 리스트
	 * @return
	 * @throws SQLException
	 */
	public List<FAQVO> getFAQList() throws SQLException;
	
	/**
	 * FAQ 한개
	 * @param faqVO
	 * @return
	 * @throws SQLException
	 */
	public FAQVO getFAQ(int faqVO) throws SQLException;
	
	/**
	 * FAQ 등록
	 * @param faqVO
	 * @return
	 * @throws SQLException
	 */
	public int insertFAQRegist(FAQVO faqVO) throws SQLException;
	
	/**
	 * FAQ 수정
	 * @param faqVO
	 * @return
	 * @throws SQLException
	 */
	public int updateFAQ(FAQVO faqVO) throws SQLException;
	
	/**
	 * FAQ 삭제
	 * @param faqVO
	 * @return
	 * @throws SQLException
	 */
	public int deleteFAQ(int faqVO) throws SQLException;
	
}
