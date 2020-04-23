package com.zero.ufboard.web;

import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zero.common.dao.ICommonCodeDao;
import com.zero.common.vo.CodeVO;
import com.zero.login.vo.UserVO;

@Controller
@RequestMapping("/user")
public class userFormController {

	@Autowired
	private ICommonCodeDao codeDao;

	private final Logger logger = LoggerFactory.getLogger(getClass());

	@RequestMapping("/userForm")
	public String process(ModelMap model, HttpSession session) throws Exception {

		String dup_key = UUID.randomUUID().toString();
		session.setAttribute("DUP_SUBMIT_PREVENT", dup_key);
		logger.debug("dup_key = {}", dup_key);
		UserVO member = (UserVO) session.getAttribute("USER_INFO");

		List<CodeVO> a = codeDao.getCodeListByParent("UC00");
		model.addAttribute("member", member);
		model.addAttribute("catList", a);
		model.addAttribute("dup_key", dup_key);

		return "user/userForm";
	}

}
