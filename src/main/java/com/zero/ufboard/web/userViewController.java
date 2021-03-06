package com.zero.ufboard.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import com.zero.ufboard.service.IUFBoardService;
import com.zero.ufboard.vo.UFBoardVO;

@Controller
@RequestMapping("/user")
public class userViewController {

	private final Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	private IUFBoardService iUFBoardService;

	@RequestMapping(value = "/userView", method = RequestMethod.GET, params = "ufCode")
	public String userView(HttpServletRequest req, HttpServletResponse resp, @RequestParam("ufCode") String ufCode,
			ModelMap model, HttpSession session) throws Exception {

		int check;
		UFBoardVO board = iUFBoardService.getBoard(ufCode);
		UserVO user = (UserVO) session.getAttribute("USER_INFO");
		UFBoardVO userLike = new UFBoardVO();
		userLike.setUfCode(ufCode);
		if (user != null) {
			userLike.setUfId(user.getUserId());
		}
		check = iUFBoardService.checkLike(userLike);
		logger.debug("userView check test : {}", check);

		logger.debug("searchVO : {}", board);

		model.addAttribute("user", user);
		model.addAttribute("board", board);
		model.addAttribute("check", check);

		return "/user/userView";
	}

	@RequestMapping(value = "/userViewL", params = "love")
	public String recommend(ModelMap model, @RequestParam("ufCode") String ufCode, HttpSession session)
			throws Exception {

		int check;
		UFBoardVO userLike = new UFBoardVO();
		UserVO user = (UserVO) session.getAttribute("USER_INFO");

		userLike.setUfCode(ufCode);
		userLike.setUfId(user.getUserId());

		iUFBoardService.recommend(ufCode);
		iUFBoardService.insertLike(userLike);

		return "redirect:/user/userView?ufCode=" + ufCode;

	}

}
