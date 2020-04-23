package com.zero.market.web;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.zero.market.service.IMarketService;
import com.zero.market.vo.MarketSearchVO;
import com.zero.market.vo.MarketVO;

@Controller
@RequestMapping("/market")
public class MmController {
	@Autowired
	private IMarketService iMarketService;

	private final Logger logger = LoggerFactory.getLogger(getClass());

	@RequestMapping(value = "mm")
	public String main(ModelMap model) throws Exception {

		List<MarketVO> market = iMarketService.getMarketList();
		logger.debug("market={}", market);

		model.addAttribute("market", market);

		return "/market/mm";
	}

	/*
	 * @RequestParam("searchWord") String searchWord,
	 * searchVO.setSearchWord(searchWord);
	 */
	@RequestMapping(value = "mm", method = RequestMethod.GET)
	public String main2(ModelMap model, String sCategory, MarketSearchVO searchVO) throws Exception {
		logger.debug("sCategory={}", sCategory);
		searchVO.setSearchCategory(sCategory);
		logger.debug("searchVO={}", searchVO.getSearchWord());
		logger.debug("searchVO={}", searchVO.getSearchCategory());

		List<MarketVO> market = iMarketService.getMarketList(searchVO);
		logger.debug("market={}", market);

		model.addAttribute("searchVO", searchVO);
		model.addAttribute("market", market);

		return "/market/mm";
	}
}
