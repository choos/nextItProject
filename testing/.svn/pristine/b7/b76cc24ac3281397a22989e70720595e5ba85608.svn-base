package com.zero.reply.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.zero.reply.dao.IReplyDao;
import com.zero.common.exception.BizAccessFailException;
import com.zero.common.exception.BizNotFoundException;
import com.zero.purchase.vo.PurchaseSearchVO;
import com.zero.common.exception.BizException;
import com.zero.reply.vo.ReplySearchVO;
import com.zero.reply.vo.ReplyVO;
import com.zero.util.ReviewFileUtils;


@Service
public class ReplyServiceImpl implements IReplyService{

	@Autowired
	private IReplyDao replyDao ;
	
	@Resource(name="ReviewFileUtils")
	private ReviewFileUtils fileUtils;
	
	@Inject
	private IReplyDao replydao ;
	
	@Override
	public List<ReplyVO> getReplyList(ReplySearchVO searchVO) throws BizException {
		searchVO.setting();
		return replyDao.getReplyList(searchVO);
	}

	@Override
	public void registReply(ReplyVO reply) throws BizException {
		replyDao.insertReply(reply);
		
	}

	@Override
	public void modifyReply(ReplyVO reply) throws BizException {
		ReplyVO vo = replyDao.getReply(reply.getSrNum());
		if(vo == null) {
			throw new BizNotFoundException("글번호[" + reply.getSrNum() + "]을 조회하지 못했습니다." ); 
		}
		if(!vo.getSrMemId().equals(reply.getSrMemId())) {
			throw new BizAccessFailException("해당 글의 작성자가 아닙니다." );
		}
		replyDao.updateReply(reply);
		
	}

	@Override
	public void removeReply(ReplyVO reply) throws BizException {
		ReplyVO vo = replyDao.getReply(reply.getSrNum());
		if(vo == null) {
			throw new BizNotFoundException("글번호[" + reply.getSrNum() + "]을 조회하지 못했습니다." ); 
		}
		if(!vo.getSrMemId().equals(reply.getSrMemId())) {
			throw new BizAccessFailException("해당 글의 작성자가 아닙니다." );
		}
		replyDao.deleteReply(reply);
		
	}

	@Override
	public List<ReplyVO> getReplyCount(String srCode) throws BizException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getReplyMemberCount(PurchaseSearchVO psearchVO) throws BizException {
		return replyDao.getReplyMemberCount(psearchVO);
	}

	@Override
	public void write(ReplyVO board, MultipartHttpServletRequest mpRequest) throws Exception {
		replydao.insertReply(board);
		
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(board, mpRequest); 
		int size  = list.size();
		if(size != 0) {
			replydao.insertFile(list.get(0));
		}
		
	}





}
