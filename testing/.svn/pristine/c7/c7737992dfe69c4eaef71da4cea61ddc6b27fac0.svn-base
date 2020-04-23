package com.zero.member.web;

import java.net.URLDecoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.zero.common.exception.BizNotFoundException;
import com.zero.common.exception.BizRegistFailException;
import com.zero.common.service.ICommonCodeService;
import com.zero.common.vo.CodeVO;
import com.zero.common.vo.ResultMessageVO;
import com.zero.member.service.IMemberService;
import com.zero.member.vo.MemberSearchVO;
import com.zero.member.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private IMemberService memberService;
	
	@Autowired
	private ICommonCodeService codeDao;
	
	@RequestMapping("/memberList")
	public void memberList(ModelMap model, @ModelAttribute("searchVO") MemberSearchVO searchVO) throws Exception {		
		logger.debug("debug searchVO : {}", searchVO);
		
		List<MemberVO> list = memberService.getMemberList(searchVO);
		
		logger.info("list size = {}", list.size());
		
		model.addAttribute("list", list);
		model.addAttribute("searchVO", searchVO);
		
		//return "member/memberList";
	}
	
	
	@RequestMapping(value = "/memberView", method = RequestMethod.GET, params = "memId")
	public String memberView(HttpServletRequest req, HttpServletResponse resp,
		 @RequestParam("memId")	String memId, ModelMap model) throws Exception {
		try {
			MemberVO member = memberService.getMember(memId);
			model.addAttribute("mem", member);
			System.out.println("~~~~~~~~으아아아아~~~~~" + member.getMemId() + "~~~~~~~");
			return "member/memberView";
		} catch (BizNotFoundException e) {
			logger.error("조회오류 = {}",memId, e);
			ResultMessageVO message = new ResultMessageVO();
			message.setResult(false)
						 .setTitle("조회 실패")
						 .setMessage("해당 회원이  존재하지 않습니다 <br>회원이 삭제되었거나...")
						 .setUrl("/member/memberList")
						 .setUrlTitle("목록");
			model.addAttribute("resultMessage", message);
			return "common/message";
		}
	}
	
	@RequestMapping(value = "/memberEdit")
	public String memberEdit(String memId, ModelMap model) throws Exception {
		
		MemberVO vo = memberService.getMember(memId);
		
		model.addAttribute("mem", vo);
		
		
		return "member/memberEdit";
	}
	
	
	@RequestMapping(value = "/memberModify", method = RequestMethod.POST)
	public String memberModify(MemberVO member, HttpServletRequest req, ModelMap model) throws Exception {
		try {
			memberService.updateMember(member);
			return "redirect:memberList?msg=" + URLDecoder.decode("success", "utf-8");
		} catch (BizRegistFailException e) {
			e.printStackTrace();
			ResultMessageVO message = new ResultMessageVO();
			message.setResult(false)
						 .setTitle("수정실패")
						 .setMessage("회원 수정에 실패했습니다")
						 .setUrl("/member/memberList")
						 .setUrlTitle("목록으로");
			
			model.addAttribute("resultMessage", message);
			return "common/message";
		}
	}
	
	
	
	
	@RequestMapping(value = "/memberForm")
	public String memberForm(MemberVO member, HttpServletRequest req, ModelMap model) throws Exception {

		List<CodeVO> jobList = codeDao.getCodeListByParent("JB00");
		List<CodeVO> likeList = codeDao.getCodeListByParent("HB00");
		model.addAttribute("job", jobList);
		model.addAttribute("like", likeList);
		return "member/memberForm";
	}
	
	
	@RequestMapping(value = "/memberRegist", method = RequestMethod.POST)
	public String memberRegist(MemberVO member,HttpSession session,  HttpServletRequest req, ModelMap model 
					) throws Exception {
		try {
			memberService.registMember(member);
			return "redirect:/home/home";
		} 	catch (BizRegistFailException e) {
			ResultMessageVO message = new ResultMessageVO();
			message.setResult(false)
						 .setTitle("중복등록")
						 .setMessage("회원 등록에 실패했습니다")
						 .setUrl("/member/memberList")
						 .setUrlTitle("목록으로");
			
			model.addAttribute("resultMessage", message);
			return "common/message";
		}
	}
	
	
	
	@RequestMapping(value = "/memberDelete")
	public String freeDelete(MemberVO member, ModelMap model) throws Exception {
		try {
			memberService.removeMember(member);
			return "redirect:memberList?msg=" + URLDecoder.decode("success", "utf-8");
		} catch (BizRegistFailException e) {
			e.printStackTrace();
			ResultMessageVO message = new ResultMessageVO();
			message.setResult(false)
			.setTitle("삭제실패")
			.setMessage("회원이 존재하지 않거나 뭔가 이상합니다")
			.setUrl("/member/memberList")
			.setUrlTitle("목록으로");
			
			model.addAttribute("resultMessage", message);
			return "common/message";
		}
	}
	
	
	
	
}
