package com.zero.careFridge.wep;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zero.careFridge.service.ICareFridgeService;
import com.zero.ufboard.vo.UFBoardVO;

@Controller
public class CareFridgeController {
	
	
	@Autowired
	private ICareFridgeService careService;
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping("/careFridge/careFridge")
	public String getFoodlist(ModelMap model)throws Exception {
		return "careFridge/careFridge";
	}
	
	@RequestMapping(value = "/food/foodList")
	@ResponseBody
	public Map<String, Object> getFood(String food)throws Exception {//음식 카테고리 받기
		logger.debug("food={}",food);
		Map<String, Object> map = new HashMap<String, Object>();
		List<FoodListVO> list = careService.getFood(food);
		logger.debug("list={}",list);

		map.put("result", true);
		map.put("data", list);
		map.put("name", food);
		return map;		
	}
	
	@RequestMapping(value = "/careFridge/careFridgeView")
	 public String getRecipeList(CataFridgeSearchVO searchVO, ModelMap model)throws Exception {
		searchVO.setFoodNames(searchVO.getFoodNameList().split(","));
		List<UFBoardVO> list = careService.getRecipeList(searchVO);
		
		logger.debug("getCurPage{}",searchVO.getCurPage());
		logger.debug("list{}", list);
		model.addAttribute("foodNameList",list);
		model.addAttribute("searchVO", searchVO);
		
		logger.debug("*********************************");
		logger.debug("searchVO={}",searchVO);
		logger.debug("*********************************");
		 return "careFridge/careFridgeView";
	}
	
}
