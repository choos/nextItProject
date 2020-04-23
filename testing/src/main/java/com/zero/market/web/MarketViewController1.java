package com.zero.market.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.zero.login.vo.UserVO;
import com.zero.market.service.IMarketService;
import com.zero.market.vo.MarketVO;
import com.zero.purchase.service.IPurchaseService;
import com.zero.purchase.vo.PurchaseSearchVO;
import com.zero.reply.service.IReplyService;

@Controller
@RequestMapping("/market")
public class MarketViewController1 {
	@Autowired
	private IReplyService replyService;
	@Autowired
	private IMarketService iMarketService;
	@Autowired
	private IPurchaseService iPurchaseService;

	private final Logger logger = LoggerFactory.getLogger(getClass());

	@RequestMapping("/marketView1")
	public String main(ModelMap model, HttpSession session, String sCode) throws Exception {
		MarketVO market = iMarketService.getMarket(sCode);
		UserVO user = (UserVO) session.getAttribute("USER_INFO");

		List<MarketVO> marketReview = iMarketService.getMarketReviewList(sCode);
		logger.debug("market1={}", market);
		logger.debug("marketReview={}", marketReview);
		logger.debug("market1={}", market.getsLove());
		logger.debug("market1={}", market.getsNum());
		logger.debug("market={}", market.getsCode());

		// 寃뚯떆臾� 異붿쿇�쓣 �쐞�븳 �븘�씠�뵒, �긽�뭹移댄뀒怨좊━
		int check;
		MarketVO marketLike = new MarketVO();
		marketLike.setsCode(sCode);
		if (user != null) {
			marketLike.setSmId(user.getUserId());
		}
		check = iMarketService.checkLike(marketLike);
		logger.debug("check={}", check);

		// 援щℓ�븳 �쟻�씠 �엳�쓣 �떆 �뙎湲� �옉�꽦 媛��뒫

		PurchaseSearchVO psearchVO = new PurchaseSearchVO();
		psearchVO.setSearchPCode(sCode);
		if (user != null) {
			psearchVO.setUserId(user.getUserId());
			int count = replyService.getReplyMemberCount(psearchVO);
			logger.debug("count={}", count);
			if (count > 0) {
				int purchase = iPurchaseService.getPurchaseQty(psearchVO);

				logger.debug("purchase={}", purchase);
				model.addAttribute("purchase", purchase);
				model.addAttribute("a", count);
			}
		}

		model.addAttribute("psearchVO", psearchVO);
		model.addAttribute("market", market);
		model.addAttribute("marketReview", marketReview);
		model.addAttribute("check", check);

		return "/market/marketView1";
	}

	// 寃뚯떆臾� 異붿쿇 愿��젴 硫붿냼�뱶
	@RequestMapping(value = "/marketView1", params = "love")
	public String recommend(ModelMap model, @RequestParam("sCode") String sCode, HttpSession session) throws Exception {
		logger.debug("start1");

		MarketVO marketLike = new MarketVO();
		UserVO user = (UserVO) session.getAttribute("USER_INFO");

		marketLike.setsCode(sCode);
		marketLike.setSmId(user.getUserId());

		iMarketService.recommend(sCode);
		iMarketService.insertLike(marketLike);

		logger.debug("start2");

		return "redirect:/market/marketView1?sCode=" + sCode;
	}

}
