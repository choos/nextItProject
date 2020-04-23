package com.zero.reply.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.zero.purchase.vo.PurchaseSearchVO;
import com.zero.reply.vo.ReplySearchVO;
import com.zero.reply.vo.ReplyVO;

@Mapper
public interface IReplyDao {

	/**
	 * sr_S_Code 가 설정되어 있어요 
	 * @param searchVO
	 * @return
	 */
	public List<ReplyVO> getReplyCount(String srCode) ;
	
	public int getReplyMemberCount(PurchaseSearchVO psearchVO);
	
	public List<ReplyVO> getReplyList(ReplySearchVO searchVO) ;
	
	public ReplyVO getReply(int srNum);
	
	public int insertReply(ReplyVO reply);
	
	public int updateReply(ReplyVO reply);
	
	public int deleteReply(ReplyVO reply);
	
	public void insertFile(Map<String, Object> map) throws Exception;
	
	
	
}
