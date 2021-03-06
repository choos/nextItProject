package com.zero.market.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zero.market.service.IMarketCreateReviewService;



@Controller
@RequestMapping("/market")
public class CreateReviewController {

	@Autowired
	private IMarketCreateReviewService iCreateReviewService;
	
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	
	@RequestMapping(value = "createReview")
	public String main(ModelMap model) throws Exception {
		
//		List<MarketCreateReviewVO>  createreview = iCreateReviewService.getMarketCreateReviewList();
//		logger.debug("createreview={}", createreview);
//		
//		model.addAttribute("createreview", createreview);
		
		return "/market/createReview";
	}
	
}
