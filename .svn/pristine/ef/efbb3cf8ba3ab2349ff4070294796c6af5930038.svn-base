package com.zero.QNA.service;

import java.util.List;

import com.zero.QNA.vo.QNAVO;
import com.zero.common.exception.BizException;

public interface IQNAService {
	
	//카테고리별 리스트
	public List<QNAVO> getQNACategory(String faCategory) throws BizException;
	
	//전체리스트
	public List<QNAVO> getQNAList() throws BizException;
	
	//유저가 자신 질문글 보기
	public QNAVO getQNA(int qNum) throws BizException;
	
	//유저 질문등록
	public void insertQNARegist(QNAVO qanVO) throws BizException;
    
	//유저 질문 수정
	public void updateQNA(QNAVO qanVO) throws BizException;
	   
	//유저 질문 삭제
	public void deleteQNA(int qNum) throws BizException;
	
	//유저 질문 답변여부
	public void AnsweNY(int qNum) throws BizException;
	
	//관리자->유저 질문 답하기
	public void insertOTO(QNAVO otoVO) throws BizException;
	
	//관리자 답변 수정
	public void updateOTO(QNAVO otoVO) throws BizException;

	//public QNAVO OTOAnswer(int qNum) throws BizException;
	//public List<QNAVO> getOTOList() throws BizException;
}
