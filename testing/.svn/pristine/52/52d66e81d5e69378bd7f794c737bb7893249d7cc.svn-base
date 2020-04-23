package com.zero.main.wep;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zero.main.service.IMainService;
import com.zero.market.vo.MarketVO;
import com.zero.mfboard.vo.MFBoardVO;
import com.zero.ufboard.vo.UFBoardVO;

@Controller
public class MainController {

	@Autowired
	private IMainService iMainService;

	private final Logger logger = LoggerFactory.getLogger(getClass());

	@RequestMapping("home/home")
	public String main(ModelMap model) throws Exception {
		return "home/home";// /폴더명/파일명
	}
	
	@RequestMapping(value = "/home/cate")
	@ResponseBody
	public Map<String, Object> mainAjax(@RequestParam(name = "cate", required = false) String cate) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<MFBoardVO> MFB = iMainService.getMFBoard(cate);
		List<UFBoardVO> UFB = iMainService.getUFBoard(cate);
		List<MarketVO> SB =   iMainService.getSalesBoard(cate);
		
		logger.debug("MFB={}", MFB);
		logger.debug("UFB={}", UFB);
		logger.debug("SB={}", SB);
		
		map.put("result", true);
		map.put("mfb", MFB);
		map.put("ufb", UFB);
		map.put("sb", SB);
		
		return map;// /폴더명/파일명
	}
	
	@RequestMapping("/home/homeSearchView") // 파일명
	public String mainsearchView(MainSearchVO searchVO, ModelMap model) throws Exception {
		
		logger.debug("=========================================================");
		logger.debug("searchVO.getSearchType={}", searchVO.getSearchType());
		logger.debug("searchVO={}", searchVO);
		logger.debug("=========================================================");
		if (!searchVO.getSearchWord().isEmpty()) {
			if (searchVO.getSearchType().contains("UF")) {
				List<UFBoardVO> UFSearch = iMainService.getUFSearch(searchVO);
				logger.debug("UFSearch={}", UFSearch);
				model.addAttribute("UFSearch", UFSearch);
			} else if (searchVO.getSearchType().contains("MF")) {
				List<MFBoardVO> MFSearch = iMainService.getMFSearch(searchVO);
				logger.debug("MFSearch={}", MFSearch);
				model.addAttribute("MFSearch", MFSearch);
			} else {
				List<MarketVO> SBSearch = iMainService.getSBSearch(searchVO);
				logger.debug("SBSearch={}", SBSearch);
				model.addAttribute("SBSearch", SBSearch);
			}
		}else {
			String wordNull ="검색어가 입력되지 않았습니다.";
			model.addAttribute("wordNull",wordNull);
		}
		
		model.addAttribute("searchVO",searchVO);
		return "home/homeSearchView";// /폴더명/파일명
	}
}
