package com.zero.FAQ.wep;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.zero.FAQ.service.IFAQService;
import com.zero.FAQ.vo.FAQVO;
import com.zero.common.vo.ResultMessageVO;
import com.zero.login.vo.UserVO;

@Controller
public class FAQController {
	
	@Autowired
	IFAQService faqService;
	
	ResultMessageVO messageVO;
	
	private final Logger logger = LoggerFactory.getLogger(getClass());

	@RequestMapping("FAQ/FAQ")
	public String FAQList(ModelMap moderMap, HttpSession session) {

		UserVO user = (UserVO)session.getAttribute("USER_INFO");
		List<FAQVO> faqvo = faqService.getFAQList();
		
		moderMap.addAttribute("user", user);
		moderMap.addAttribute("faqvo", faqvo);
		return "FAQ/FAQ";
	}
	
	@RequestMapping(value = "FAQ/FAQ", method = RequestMethod.GET, params = "faCategory")
	public String GetFAQCategory(String faCategory, ModelMap moderMap, HttpSession session) {
		logger.debug("faCategory", faCategory);
		
		UserVO user = (UserVO)session.getAttribute("USER_INFO");
		List<FAQVO> faqvo = faqService.getFAQCategory(faCategory);
		
		moderMap.addAttribute("user", user);
		moderMap.addAttribute("faqvo", faqvo);
		return "FAQ/FAQ";
	}
	
	
	@RequestMapping("FAQ/FAQFrom")
	public String FAQForm() {
		return "FAQ/FAQFrom";
	}
	
	@RequestMapping("FAQ/FAQRegist")
	public String FAQRegist(FAQVO faqVO, ModelMap model) {
		logger.debug("faqVO={}", faqVO);
		
		try {
			faqService.insertFAQRegist(faqVO);
		} catch (Exception e) {
			messageVO = new ResultMessageVO();
			messageVO.setResult(false)
			.setTitle("글쓰기 실패")
			.setMessage("글등록에 실패하였습니다.")
			.setUrl("/FAQ/FAQ")
			.setUrlTitle("FAQ 리스트로 돌아가기");
			model.addAttribute("resultMessage", messageVO);
			return "commonmessage";
		}
		
		return "redirect:/FAQ/FAQ";
	}
	
	@RequestMapping(value = "FAQ/FAQEdit", method = RequestMethod.GET, params = "faNum")
	public String FAQEdit(int faNum, ModelMap model) {
		FAQVO faqVO = faqService.getFAQ(faNum);
		model.addAttribute("faqVO", faqVO);
		return "FAQ/FAQEdit";
	}
	
	@RequestMapping(value = "FAQ/FAQMdify", method =RequestMethod.POST)
	public String FAQMdify(FAQVO faqVO, ModelMap model) {
		logger.debug("faqVO={}", faqVO);
		try {
			faqService.updateFAQ(faqVO);
			return "redirect:/FAQ/FAQ";
		} catch (Exception e) {
			messageVO = new ResultMessageVO();
			messageVO.setResult(false)
			.setTitle("글수정 실패")
			.setMessage("글수정에 실패하였습니다.")
			.setUrl("/FAQ/FAQ")
			.setUrlTitle("FAQ 리스트로 돌아가기");
			model.addAttribute("resultMessage", messageVO);
			return "common/message";
		}
	}
	
	@RequestMapping(value = "FAQ/FAQDelet", method = RequestMethod.GET, params = "faNum")
	public String FAQDelet(int faNum, ModelMap model) {
		try {
			logger.debug("faNum={}", faNum);
			faqService.deleteFAQ(faNum);
			return "redirect:/FAQ/FAQ";
		} catch (Exception e) {
			messageVO = new ResultMessageVO();
			messageVO.setResult(false)
			.setTitle("글수정 실패")
			.setMessage("글수정에 실패하였습니다.")
			.setUrl("/FAQ/FAQ")
			.setUrlTitle("FAQ 리스트로 돌아가기");
			model.addAttribute("resultMessage", messageVO);
			return "common/message";
		}
	}
}
