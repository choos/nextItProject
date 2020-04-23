package com.zero.myPage.web;

import java.net.URLDecoder;

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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.zero.common.exception.BizRegistFailException;
import com.zero.common.vo.ResultMessageVO;
import com.zero.login.vo.UserVO;
import com.zero.member.vo.MemberSearchVO;
import com.zero.myPage.service.IMyPageService;
import com.zero.myPage.vo.MyPageVO;


@Controller
@RequestMapping("myPage")
public class MypageController {
	

	@Autowired
	private IMyPageService mypageService;

	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping(value = "myPage", method = RequestMethod.GET )
	public String myPage(ModelMap model, HttpSession session, MemberSearchVO searchVO, String memId, String memPass) throws Exception {
		
		UserVO member = (UserVO) session.getAttribute("USER_INFO");
		logger.debug("memId = {}", memId);
		model.addAttribute("member", member);
		
		
		return "myPage/myPage";
	}
	
	@RequestMapping(value = "myPageView", params = "memId", method = RequestMethod.GET)
	public String myPageView(ModelMap model, String memId) throws Exception{
		MyPageVO mypage = mypageService.getMemberInfo(memId);
		
		model.addAttribute("mypage", mypage);
		
		return "myPage/myPageView";
		
	}
	
	@RequestMapping(value = "myPageModify", method = RequestMethod.POST)
	public String myPageModify(ModelMap model, @ModelAttribute("mypage") @Valid  MyPageVO mypage, HttpSession session) throws Exception{
		try {

			
			mypageService.updateMemberInfo(mypage);
			UserVO vo = new UserVO();
			vo.setUserId(mypage.getMemId());
			vo.setUserPass(mypage.getMemPass());
			vo.setUserName(mypage.getMemName());
			
			session.setAttribute("USER_INFO", vo);
			
			return "redirect:myPage?memId=" + URLDecoder.decode("success", "utf-8");
		} catch (BizRegistFailException e) {
			e.printStackTrace();
			ResultMessageVO message = new ResultMessageVO();
			message.setResult(false)
						 .setTitle("�닔�젙�떎�뙣")
						 .setMessage("�쉶�썝�젙蹂� �닔�젙�뿉 �떎�뙣�뻽�뒿�땲�떎")
						 .setUrl("/myPage/myPage")
						 .setUrlTitle("�떎�떆�븯湲�");
			
			model.addAttribute("resultMessage", message);
			return "common/message";
		}
	}
		
		@RequestMapping(value = "myPageDelete", params = "memId")
		public String process(HttpServletRequest req, HttpServletResponse resp, HttpSession session) throws Exception {
			
			
			UserVO vo = new UserVO();
			session.setAttribute("USER_INFO", vo);
			
			
			MyPageVO mypage = new MyPageVO();
			BeanUtils.populate(mypage, req.getParameterMap());
			int res = mypageService.deleteMemberInfo(mypage);

			
			if (vo.getUserId() == mypage.getMemId()) {
				
			
			
			
			if(res>0) {
				ResultMessageVO message = new ResultMessageVO();
				message.setResult(true)
								.setTitle("�궘�젣�꽦怨�")
								.setMessage("�쑀���젙蹂대�� �궘�젣�뻽�뒿�땲�떎.")
								.setUrl("/home/home")
								.setUrlTitle("�솃�쑝濡�");
				req.setAttribute("resultMessage", message);
				return "common/message";		
				} else {
				ResultMessageVO message = new ResultMessageVO();
				message.setResult(false)
							 .setTitle("�궘�젣�떎�뙣")
							 .setMessage("�쑀���젙蹂대�� �궘�젣�븯�뒗以� �삤瑜섍� 諛쒖깮�븯���뒿�땲�떎.")
							 .setUrl("/home/home")
							 .setUrlTitle("�솃�쑝濡�");
				
				req.setAttribute("resultMessage", message);
				return "common/message";
			}
			
		} else {
			ResultMessageVO message = new ResultMessageVO();
			message.setResult(false)
						 .setTitle("�궡�젣�떎�뙣")
						 .setMessage("�쑀���젙蹂닿� �씪移섑븯吏� �븡�뒿�땲�떎.")
						 .setUrl("/home/home")
						 .setUrlTitle("�솃�쑝濡�");
			
			req.setAttribute("resultMessage", message);
			return "common/message";
			
		}
		
	
}
		
}

