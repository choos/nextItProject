package com.zero.QNA.wep;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.zero.QNA.service.IQNAService;
import com.zero.QNA.vo.QNAVO;
import com.zero.common.exception.BizRegistFailException;
import com.zero.common.vo.ResultMessageVO;
import com.zero.login.vo.UserVO;
import com.zero.member.service.IMemberService;
import com.zero.member.vo.MemberVO;

@Controller
public class QNAController {
	
	@Autowired
	IQNAService qnaService;
	
	@Autowired
	IMemberService memberService;
	
	private final Logger logger = LoggerFactory.getLogger(getClass());

	@RequestMapping("QNA/QNA")
	public String QNAList(ModelMap moderMap, HttpSession session) {
		List<QNAVO> qanVO = qnaService.getQNAList();

		UserVO user = (UserVO)session.getAttribute("USER_INFO");
		
		moderMap.addAttribute("user", user);
		moderMap.addAttribute("qanVO", qanVO);
		return "QNA/QNA";
	}
	
	@RequestMapping(value = "QNA/QNA", method = RequestMethod.GET, params = "qCategory")
	public String getQNACategory(String qCategory, ModelMap moderMap, HttpSession session) {
		logger.debug("qCategory", qCategory);
		
		UserVO user = (UserVO)session.getAttribute("USER_INFO");
		List<QNAVO> qanVO = qnaService.getQNACategory(qCategory);
		
		moderMap.addAttribute("user", user);
		moderMap.addAttribute("qanVO", qanVO);
		return "QNA/QNA";
	}
	
	//작성한 사용자만 글 볼 수 있도록함.
	@RequestMapping(value = "QNA/QNAView", method = RequestMethod.GET, params = "qNum")
	public String getQNAView(HttpSession session, int qNum, ModelMap moderMap) {
		ResultMessageVO messageVO;
		QNAVO qanvo = qnaService.getQNA(qNum);

		logger.debug("qanvo={}", qanvo);
		logger.debug("qNum={}", qNum);
		
		if (session.getAttribute("USER_INFO") != null) {
			UserVO userInfo = (UserVO) session.getAttribute("USER_INFO");// [userId=M001, userPass=1234, userName=성윤미]
			MemberVO id = memberService.getMember(userInfo.getUserId());
			logger.debug("userInfo={}", userInfo);
		
			if (qanvo.getqMId().equals(userInfo.getUserId()) || id.getMemAdminYn().equals("Y")) {
				moderMap.addAttribute("qanvo", qanvo);
				return "QNA/QNAView";
			}else {
				messageVO = new ResultMessageVO();
				messageVO.setResult(false).setTitle("글쓴이가 아닙니다.")
				.setMessage("Q&A 답글은 본인이 아니면 볼 수 없습니다.")
				.setUrl("/QNA/QNA")
				.setUrlTitle("QNA으로 돌아가기");
				moderMap.addAttribute("resultMessage", messageVO);
				return "common/message";
			}
		}else {
			messageVO = new ResultMessageVO();
			messageVO.setResult(false).setTitle("로그인 해주세요.")
					.setMessage("Q&A 비 로그인 상태에서 이용이 불가능합니다.")
					.setUrl("/QNA/QNA")
					.setUrlTitle("QNA으로 돌아가기");
			moderMap.addAttribute("resultMessage", messageVO);
			return "common/message";
		}
	}
	
	//답글 보기
	@RequestMapping(value = "QNA/OTOView", method = RequestMethod.GET, params = "qNum")
	public String getOTOView(int qNum, HttpSession session, ModelMap moder) {
		ResultMessageVO messageVO;
		QNAVO qanvo = qnaService.getQNA(qNum);
		
		if(session.getAttribute("USER_INFO") != null) {
			UserVO userInfo = (UserVO) session.getAttribute("USER_INFO");
			MemberVO id = memberService.getMember(userInfo.getUserId());
			
			if (qanvo.getqMId().equals(userInfo.getUserId()) || id.getMemAdminYn().equals("Y")) {
				moder.addAttribute("qanvo", qanvo);
				return "QNA/OTOView";
			}else {
				messageVO = new ResultMessageVO();
				messageVO.setResult(false).setTitle("글쓴이가 아닙니다.")
				.setMessage("Q&A 답글은 본인이 아니면 볼 수 없습니다.")
				.setUrl("/QNA/QNA")
				.setUrlTitle("QNA으로 돌아가기");
				moder.addAttribute("resultMessage", messageVO);
				return "common/message";
			}
		}else {
			messageVO = new ResultMessageVO();
			messageVO.setResult(false).setTitle("로그인 해주세요.")
			.setMessage("Q&A 비 로그인 상태에서 이용이 불가능합니다.")
			.setUrl("/QNA/QNA")
			.setUrlTitle("QNA으로 돌아가기");
			moder.addAttribute("resultMessage", messageVO);
			return "common/message";
		}
	}
	
	//답글 넣기
	@RequestMapping("QNA/QNARegist")
	public String QNARegist(QNAVO qanVO, ModelMap model) {
		logger.debug("faqVO={}", qanVO);
		try {
			qnaService.insertQNARegist(qanVO);
			return "redirect:/QNA/QNA";
		} catch (Exception e) {
			ResultMessageVO messageVO = new ResultMessageVO();
			messageVO.setResult(true)
			.setTitle("등록실패")
			.setMessage("Q&A의 등록이 실패되었습니다")
			.setUrl("/QNA/QNA")
			.setUrlTitle("Q&A 리스트로 돌아가기");
			model.addAttribute("resultMessage", messageVO);
			return "common/message";
		}
		
	}
	
	//리뷰 작성
	@RequestMapping("QNA/QNAFrom")
	public String QNAForm(HttpSession session, ModelMap moder) {
		UserVO userInfo = (UserVO) session.getAttribute("USER_INFO");
		if (userInfo.getUserId().isEmpty()) {
			ResultMessageVO messageVO = new ResultMessageVO();
			messageVO.setResult(false).setTitle("로그인 해주세요.")
					.setMessage("Q&A 비 로그인 상태에서 이용이 불가능합니다.")
					.setUrl("/QNA/QNA")
					.setUrlTitle("QNA으로 돌아가기");
			moder.addAttribute("resultMessage", messageVO);
			return "common/message";
		}
		moder.addAttribute("user", userInfo);
		
		return "QNA/QNAFrom";
	}
	
	//질문 수정 에디터
	@RequestMapping(value = "QNA/QNAEdit", method = RequestMethod.GET, params = "qNum")
	public String QNAEdity(int qNum, ModelMap moderMap) {
		QNAVO qnaVO = qnaService.getQNA(qNum);
		moderMap.addAttribute("qnaVO", qnaVO);
		
		return "QNA/QNAEdit";
	}

	@RequestMapping(value = "QNA/QNAModify", method = RequestMethod.POST)
	public String QNAMdify(QNAVO qanVO, ModelMap model) {
		ResultMessageVO messageVO;
		try {
			qnaService.updateQNA(qanVO);
			messageVO = new ResultMessageVO();
			messageVO.setResult(true)
					.setTitle("수정성공")
					.setMessage("Q&A의 수정이 완료되었습니다")
					.setUrl("/QNA/QNA")
					.setUrlTitle("Q&A 리스트로 돌아가기");
			model.addAttribute("resultMessage", messageVO);
			return "common/message";
		} catch (BizRegistFailException e) {
			messageVO = new ResultMessageVO();
			messageVO.setResult(true)
			.setTitle("수정실패")
			.setMessage("Q&A의 수정이 실패되었습니다")
			.setUrl("/QNA/QNA")
			.setUrlTitle("Q&A 리스트로 돌아가기");
			model.addAttribute("resultMessage", messageVO);
			return "common/message";
		}
	}
	
	@RequestMapping(value = "QNA/QNADelete", method = RequestMethod.GET, params = "qNum")
	public String QNADelete(int qNum, ModelMap model) {
		ResultMessageVO messageVO;
		try {
			qnaService.deleteQNA(qNum);
			messageVO = new ResultMessageVO();
			messageVO.setResult(true)
			.setTitle("수정성공")
			.setMessage("Q&A의 삭제가 완료되었습니다")
			.setUrl("/QNA/QNA")
			.setUrlTitle("Q&A 리스트로 돌아가기");
			model.addAttribute("resultMessage", messageVO);
			return "common/message";
		} catch (BizRegistFailException e) {
			messageVO = new ResultMessageVO();
			messageVO.setResult(false)
			.setTitle("수정실패")
			.setMessage("Q&A의 삭제가 실패되었습니다")
			.setUrl("/QNA/QNA")
			.setUrlTitle("Q&A 리스트로 돌아가기");
			model.addAttribute("resultMessage", messageVO);
			return "common/message";
		}
	}
	
	@RequestMapping(value = "QNA/OTO")
	public String OTOList(ModelMap model) {
		List<QNAVO> qnavo = qnaService.getQNAList();
		
		logger.debug("qnavo={}", qnavo);
		model.addAttribute("qnavo", qnavo);
		return "QNA/OTO";
	}
	
	@RequestMapping(value = "QNA/QNAAnswer", method = RequestMethod.GET, params = "qNum")
	public String OTOAnswer(ModelMap model, int qNum , HttpSession session) {
		UserVO userInfo = (UserVO) session.getAttribute("USER_INFO");
		QNAVO OTOAnswer = qnaService.getQNA(qNum);
		logger.debug("userInfo={}", userInfo);
		logger.debug("OTOAnswer={}", OTOAnswer);

		model.addAttribute("OTO", OTOAnswer);
		model.addAttribute("user", userInfo);
		
		return "QNA/QNAAnswer";
	}
	
	@RequestMapping(value = "QNA/OTORegist", method = RequestMethod.POST)
	public String OTORegist(QNAVO otoVO, ModelMap model) {
		try {
			logger.debug("otoVO.getqNum({})",otoVO.getqNum());
			qnaService.insertOTO(otoVO);
			qnaService.AnsweNY(otoVO.getqNum());
			return "redirect:/QNA/OTO";
		} catch (BizRegistFailException e) {
			ResultMessageVO messageVO = new ResultMessageVO();
			messageVO.setResult(false)
			.setTitle("글등록")
			.setMessage("Q&A의 등록이 실패되었습니다")
			.setUrl("/QNA/OTO")
			.setUrlTitle("Q&A 리스트로 돌아가기");
			model.addAttribute("resultMessage", messageVO);
			return "common/message";
		}
		
	}
	
	@RequestMapping(value = "QNA/QNAAnswerEdit", method = RequestMethod.GET, params = "qNum")
	public String OTOEdit(int qNum, ModelMap model) {
		logger.debug("qNum={}", qNum);
		QNAVO otoVO = qnaService.getQNA(qNum);
		
		model.addAttribute("OTO", otoVO);
		
		return "QNA/QNAAnswerEdit";
	}
	
	@RequestMapping(value = "QNA/OTOUpdate", method = RequestMethod.POST)
	public String OTOUpdate(QNAVO otoVO, ModelMap model) {
		try {
			qnaService.updateOTO(otoVO);
			return "redirect:/QNA/OTO";
		} catch (BizRegistFailException e) {
			ResultMessageVO messageVO = new ResultMessageVO();
			messageVO.setResult(false)
			.setTitle("수정실패")
			.setMessage("답글 수정이 실패되었습니다")
			.setUrl("/QNA/OTO")
			.setUrlTitle("관리자 페이지로 돌아가기");
			model.addAttribute("resultMessage", messageVO);
			return "common/message";
		}
	}
	
}
