package com.zero.login.web;


import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.zero.common.vo.ResultMessageVO;
import com.zero.login.vo.UserVO;
import com.zero.member.service.IMemberService;
import com.zero.member.vo.MemberVO;

@Controller
public class LoginController {

	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private IMemberService memberService;

	
	@RequestMapping(value = "/login/signUp", method = RequestMethod.GET)
	public String signUp() throws Exception {
		return "login/signUp";
	}

	@RequestMapping(value = "/login/login", method = RequestMethod.GET)
	public String login() throws Exception {
		return "login/login";
	}

	@RequestMapping(value = "/login/login", method = RequestMethod.POST)
	public String loginPost(ModelMap model, String userId, String userPass, String idRemember, HttpSession session)
			throws Exception {
		logger.debug("id = {}, pw= {}", userId, userPass);
		ResultMessageVO messageVO = null;

		try {
			MemberVO mem = memberService.getMember(userId);
			if (mem.getMemPass().equals(userPass)) {
				UserVO vo = new UserVO();
				vo.setUserId(mem.getMemId());
				vo.setUserPass(mem.getMemPass());
				vo.setUserName(mem.getMemName());
				
				
				session.setAttribute("USER_INFO", vo);
				return "redirect:/home/home";
			} else {
				messageVO = new ResultMessageVO().setResult(false).setTitle("濡쒓렇�씤 �떎�뙣").setMessage("�븘�씠�뵒 �샊�� 鍮꾨�踰덊샇媛� ���졇�뒿�땲�떎.")
						.setUrl("/login/signUp").setUrlTitle("�쉶�썝媛��엯");
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			messageVO = new ResultMessageVO().setResult(false).setTitle("濡쒓렇�씤 �떎�뙣").setMessage("�빐�떦�쉶�썝�씠10 議댁옱�븯吏� �븡�뒿�땲�떎.")
					.setUrl("/login/signUp").setUrlTitle("�쉶�썝媛��엯");
			System.out.println(userId);
			System.out.println(userPass);

		}
		model.addAttribute("resultMessage", messageVO);
		return "common/message";
	}
	
	@RequestMapping(value = "/login/logout")
	public String logout(HttpSession session) throws Exception {
		// logoutService.logout(user);
		session.invalidate();
		return "redirect:/home/home";
	}

}
