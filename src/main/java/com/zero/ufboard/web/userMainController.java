package com.zero.ufboard.web;

import java.net.URLDecoder;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.beanutils.BeanUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.zero.common.exception.BizDuplicateException;
import com.zero.common.exception.BizRegistFailException;
import com.zero.common.service.ICommonCodeService;
import com.zero.common.vo.CodeVO;
import com.zero.common.vo.ResultMessageVO;
import com.zero.login.vo.UserVO;
import com.zero.ufboard.service.IUFBoardService;
import com.zero.ufboard.vo.UFBoardVO;
import com.zero.ufboard.vo.UFSearchVO;
import com.zero.util.FileUtils;

@Controller
@RequestMapping("/user")
public class userMainController {
	@Autowired
	private IUFBoardService iUFBoardService;

	@Autowired
	private ICommonCodeService codeDao;

	@Resource(name = "fileUtils")
	private FileUtils fileUtils;

	private final Logger logger = LoggerFactory.getLogger(getClass());

	@RequestMapping("userMain")
	public String main(ModelMap model, UFSearchVO searchVO, HttpSession session) throws Exception {

		logger.debug("debug searchVO : {}", searchVO);
		List<UFBoardVO> board = iUFBoardService.getBoardList(searchVO);

		UserVO member = (UserVO) session.getAttribute("USER_INFO");

		model.addAttribute("member", member);

		model.addAttribute("board", board);
		model.addAttribute("searchVO", searchVO);

		return "user/userMain";
	}

	@RequestMapping(value = "userSearch", params = "ufCategory")
	public String main2(ModelMap model, UFSearchVO searchVO, HttpSession session,
			@RequestParam("ufCategory") String ufCategory) throws Exception {
		searchVO.setSearchCategory(ufCategory);

		logger.debug("debug searchVO : {}", searchVO);
		List<UFBoardVO> board = iUFBoardService.getBoardList(searchVO);

		UserVO member = (UserVO) session.getAttribute("USER_INFO");

		model.addAttribute("member", member);

		model.addAttribute("board", board);
		model.addAttribute("searchVO", searchVO);

		return "user/userMain";
	}

	@RequestMapping(value = "/userEdit")
	public String userEdit(String ufCode, ModelMap model) throws Exception {
		UFBoardVO board = iUFBoardService.getBoard(ufCode);

		if (board.getUfLink() != null) {
			String word = board.getUfLink().replace("<iframe width=\"500\" height=\"350\" src=\"", "").replace(
					"\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>",
					"").replace("/embed", "/watch?v=");
			board.setUfLink(word);
		}

		List<CodeVO> a = codeDao.getCodeListByParent("UC00");

		model.addAttribute("board", board);
		model.addAttribute("catList", a);

		return "user/userEdit";
	}

	@RequestMapping(value = "/userRegist", method = RequestMethod.POST, params = "dup_key")
	public String userRegist(UFBoardVO board, HttpSession session, MultipartHttpServletRequest mpRequest,
			ModelMap model, @RequestParam("dup_key") String p_dup_key, CodeVO code) throws Exception {

		logger.info("info Regist:{}, VO:{}", model, board);
		logger.info("p_dup_key : {}", p_dup_key);

//		iUFBoardService.write(board, mpRequest);
		// HttpSession session =req.getSession();

		// 以묐났諛⑹� �넗�겙 �솗�씤

		String s_dup_key = (String) session.getAttribute("DUP_SUBMIT_PREVENT");

		if (p_dup_key == null || p_dup_key.isEmpty()) {

			return "redirect:/"; // �꽌釉붾┸ �꽌鍮꾩뒪 硫붿꽌�뱶�뿉�꽌
		} else {
			if (s_dup_key == null || !s_dup_key.equals(p_dup_key)) {
				ResultMessageVO message = new ResultMessageVO();
				message.setResult(false).setTitle("以묐났�벑濡�").setMessage("�깉濡�寃� �옉�꽦�빐 二쇱꽭�슂").setUrl("/user/userForm")
						.setUrlTitle("�깉湲��벑濡�");

				model.addAttribute("resultMessage", message);
				return "common/message";
			}
		}

		try {
			// 泥⑤��뙆�씪 VO �쑀��VO�뿉 �뀑�똿

			fileUtils.fileInfo2Board(board, mpRequest);

			if (!board.getUfLink().isEmpty()) {
				board.setUfLink(board.getUfLink().replace("https://www.youtube.com/watch?v=",
						"<iframe width=\"500\" height=\"350\" src=\"https://www.youtube.com/embed/")
						+ ("\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>"));
			}

			iUFBoardService.registBoard(board);
			session.removeAttribute("DUP_SUBMIT_PREVENT");
			board.setUfCode("U" + String.valueOf(board.getUfNum()));

			return "redirect:/user/userView?ufCode=" + board.getUfCode();
		} catch (BizDuplicateException e) {
			ResultMessageVO message = new ResultMessageVO();
			message.setResult(false).setTitle("以묐났�벑濡�").setMessage("�빐�떦 �궎媛� 以묐났�릺�뿀�뒿�땲�떎. �떎瑜� �궎瑜� �궗�슜�빐二쇱꽭�슂");
			model.addAttribute("resultMessage", message);
			return "common/message";
		} catch (BizRegistFailException e) {
			ResultMessageVO message = new ResultMessageVO();
			message.setResult(false).setTitle("以묐났�벑濡�").setMessage("寃뚯떆�뙋 �벑濡앹뿉 �떎�뙣�뻽�뒿�땲�떎").setUrl("/userMain")
					.setUrlTitle("紐⑸줉�쑝濡�");

			model.addAttribute("resultMessage", message);
			return "common/message";
		}
	}

	@RequestMapping(value = "/userModify", method = RequestMethod.POST)
	public String userModify(@ModelAttribute("user") @Valid UFBoardVO board, BindingResult errors,
			MultipartHttpServletRequest mpRequest, ModelMap model) throws Exception {
		try {

			if (errors.hasErrors()) {
				return "user/userEdit";
			}
			fileUtils.fileInfo2Board(board, mpRequest);

			if (!board.getUfLink().isEmpty()) {
				board.setUfLink(board.getUfLink().replace("https://www.youtube.com/watch?v=",
						"<iframe width=\"500\" height=\"350\" src=\"https://www.youtube.com/embed/\"")
						+ ("\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>"));

			}

			iUFBoardService.updateBoard(board);
			return "redirect:userMain?msg=" + URLDecoder.decode("success", "utf-8");
		} catch (BizRegistFailException e) {
			e.printStackTrace();
			ResultMessageVO message = new ResultMessageVO();
			message.setResult(false).setTitle("�닔�젙�떎�뙣").setMessage("寃뚯떆湲� �닔�젙�뿉 �떎�뙣�뻽�뒿�땲�떎")
					.setUrl("/user/userMain").setUrlTitle("紐⑸줉�쑝濡�");

			model.addAttribute("resultMessage", message);
			return "common/message";
		}
	}

	@RequestMapping(value = "/userDelete", params = "ufCode")
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		UFBoardVO board = new UFBoardVO();
		BeanUtils.populate(board, req.getParameterMap());
		int res = iUFBoardService.deleteBoard(board);

		if (res > 0) {
			ResultMessageVO message = new ResultMessageVO();
			message.setResult(true).setTitle("�궘�젣�꽦怨�").setMessage("�빐�떦湲��쓣 �궘�젣�뻽�뒿�땲�떎.").setUrl("/user/userMain")
					.setUrlTitle("紐⑸줉�쑝濡�");
			req.setAttribute("resultMessage", message);
			return "common/message";
		} else {
			ResultMessageVO message = new ResultMessageVO();
			message.setResult(false).setTitle("�궘�젣�떎�뙣").setMessage("湲��씠 議댁옱�븯吏� �븡嫄곕굹 �뙣�뒪�썙�뱶媛� ��由쎈땲�떎")
					.setUrl("usre/usreMain").setUrlTitle("紐⑸줉�쑝濡�");

			req.setAttribute("resultMessage", message);
			return "common/message";
		}

	}

}
