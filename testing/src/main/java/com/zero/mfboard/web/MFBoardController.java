package com.zero.mfboard.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.zero.login.vo.UserVO;
import com.zero.mfboard.service.IMFBoardService;
import com.zero.mfboard.vo.MFBoardVO;
import com.zero.mfboard.vo.MFSearchVO;

@Controller
@RequestMapping("/mfboard")
public class MFBoardController {

	@Autowired
	private IMFBoardService iMFBoardService;

	private final Logger logger = LoggerFactory.getLogger(getClass());

	@RequestMapping(value = "mfMain")
	public String main(ModelMap model, MFSearchVO searchVO, HttpSession session, String mfCode) throws Exception {
		List<MFBoardVO> mfboard = iMFBoardService.getMFBoardList(searchVO);
		logger.debug("mfboard={}", mfboard);
		model.addAttribute("mfboard", mfboard);
		return "/mfboard/mfMain";

	}

	@RequestMapping(value = "mfMain", method = RequestMethod.GET, params = "mfCategory")
	public String main2(ModelMap model, @RequestParam("mfCategory") String mfCategory, MFSearchVO searchVO)
			throws Exception {
		searchVO.setSearchCategory(mfCategory);

		logger.debug("searchVO={}", searchVO.getSearchCategory());
		logger.debug("searchVO={}", searchVO.getSearchWord());

		List<MFBoardVO> mfboard = iMFBoardService.getMFBoardList(searchVO);
		model.addAttribute("searchVO", searchVO);
		model.addAttribute("mfboard", mfboard);

		return "/mfboard/mfMain";

	}

	@RequestMapping(value = "mfView", method = RequestMethod.GET)
	public String main3(ModelMap model, HttpSession session, String mfCode) throws Exception {
		UserVO user = (UserVO) session.getAttribute("USER_INFO");
		int check;
		MFBoardVO marketLike = new MFBoardVO();
		marketLike.setMfCode(mfCode);
		if (user != null) {
			marketLike.setMfMId(user.getUserId());
		}
		check = iMFBoardService.checkLike(marketLike);
		logger.debug("check={}", check);
		logger.debug("�떎�뻾 泥댄겕 �떆�옉");

		MFBoardVO boardinfo = iMFBoardService.getMFBoard(mfCode);

		logger.debug("mfCode = {}", mfCode);
		logger.debug("�떎�뻾 泥댄겕 �걹");

		logger.debug("boardinfo={}", boardinfo.getMfCode());

		model.addAttribute("boardinfo", boardinfo);
		model.addAttribute("check", check);

		return "/mfboard/mfView";

	}

	// 寃뚯떆臾� 異붿쿇 愿��젴 硫붿냼�뱶
	@RequestMapping(value = "/mfView", params = "love")
	public String recommend(ModelMap model, @RequestParam("mfCode") String mfCode, HttpSession session)
			throws Exception {
		logger.debug("start1");

		int check;

		MFBoardVO marketLike = new MFBoardVO();
		UserVO user = (UserVO) session.getAttribute("USER_INFO");

		marketLike.setMfCode(mfCode);
		marketLike.setMfMId(user.getUserId());

		iMFBoardService.recommend(mfCode);
		iMFBoardService.insertLike(marketLike);

		logger.debug("start2");

		return "redirect:/mfboard/mfView?mfCode=" + mfCode;
	}

}
