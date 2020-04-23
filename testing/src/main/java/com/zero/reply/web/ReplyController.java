package com.zero.reply.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.zero.login.vo.UserVO;
import com.zero.reply.vo.ReplySearchVO;
import com.zero.reply.vo.ReplyVO;
import com.zero.util.ReviewFileUtils;
import com.zero.reply.service.IReplyService;

@Controller
public class ReplyController {

	private final Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	private IReplyService replyService;
	
	@Resource(name="ReviewFileUtils")
	private ReviewFileUtils fileUtils;

	@RequestMapping(value = "/reply/replyList", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> replyList(ReplySearchVO searchVO) throws Exception {

		logger.debug("searchVO={}", searchVO);

		List<ReplyVO> list = replyService.getReplyList(searchVO);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", true);
		map.put("data", list);
		logger.debug("list={}", list);
		map.put("count", list.size());

		return map; // reply/replyList
	}

	@RequestMapping(value = "/reply/replyRegist", method = RequestMethod.POST)
	public String replyRegist(ModelMap model, ReplyVO reply, MultipartHttpServletRequest mpRequest, HttpServletRequest req, HttpSession session,
			@RequestParam("sCode") String sCode) {
//		fileInfo2Board
		// TOOD : 濡쒓렇�씤 �젙蹂� �솗�씤 泥섎━
		UserVO user = (UserVO) session.getAttribute("USER_INFO");
		reply.setSrMemId(user.getUserId()); // user.getUserId();
		reply.setSrSCode(sCode);
		logger.debug("sCode = {}", sCode);

		try {
			fileUtils.fileInfo2Board(reply, mpRequest);
		} catch (Exception e) {
			e.printStackTrace();
		}

		replyService.registReply(reply);
		/*
		 * Map<String, Object> map = new HashMap<String, Object>(); map.put("result",
		 * true); // map.put("data", replyService.getReply(reply.getReNo()));
		 * map.put("msg", "�젙�긽 �벑濡� �릺�뿀�뒿�땲�떎.");
		 */
		return "redirect:/market/marketView1?sCode=" + reply.getSrSCode(); // reply/replyList  "/mfboard/mfMain"; redirect:/mfboard/mfView?mfCode= + reply
	}

	@PostMapping(value = "/reply/replyModify", produces = "multipart/form-data")
    public String modifyReply(ModelMap model, ReplyVO reply, MultipartHttpServletRequest mpRequest, 
    		@RequestParam("sCode") String sCode,	 ReplySearchVO searchVO,  HttpServletRequest req, HttpSession session) throws Exception{
		logger.debug("�꽆�뼱�솓�깘~~?~~~~~~?~~~~~~~~~~");
		logger.debug("reply={}", reply);
		// TOOD : 濡쒓렇�씤 �젙蹂� �솗�씤 泥섎━
		/* List<ReplyVO> list = replyService.getReplyList(searchVO); */
		UserVO user = (UserVO) session.getAttribute("USER_INFO");
		reply.setSrMemId(user.getUserId()); // user.getUserId();
	
		reply.setSrSCode(sCode); 
		 
		

		try {
			fileUtils.fileInfo2Board(reply, mpRequest);
		} catch (Exception e) {
			e.printStackTrace();
		}
       replyService.modifyReply(reply);
       return "redirect:/market/marketView1?sCode=" + reply.getSrSCode();
    }
    

	
  @RequestMapping(value="/reply/replyRemove")
	@ResponseBody
	public  Map<String, String> replyRemove(ReplyVO reply, @RequestParam("sCode") String sCode, @RequestParam("srNum") int srNum, HttpSession session ) {
	  logger.debug("�궘�젣媛��뒫�븯�깘~~~~~~~~~~~~~~~~~~?");
		
		UserVO user =(UserVO) session.getAttribute("USER_INFO");
		reply.setSrMemId(user.getUserId());		// user.getUserId();
		reply.setSrNum(srNum);
		reply.setSrSCode(sCode);
		logger.debug("reply12={}", reply);
		
		replyService.removeReply(reply);

		Map<String, String> result = new HashMap<String, String>();
		result.put("result", "success");
		
		return result;
	}
	
	


}
