package com.jiabin.controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jiabin.service.BigTypeService;
import com.jiabin.service.ZycService;

@Controller
@RequestMapping("/")
public class IndexController {
	
	@Resource
	private ZycService zycService;
	
	@Resource
	private BigTypeService bigTypeService;
	

	/**
	 * 请求主页（index）
	 * @return
	 */
	@RequestMapping("/index")
	public ModelAndView index(@RequestParam(value="page",required=false)String page,
			@RequestParam(value="bigTypeId",required=false)Integer bigTypeId,
			HttpServletRequest request)throws Exception{		
		/*Map<String,Object> map=new HashMap<String,Object>(); 		
		map.put("slide", 1);
		map.put("start", 0);
		map.put("size", 5);
		List<Zyc> slideZycList = zycService.find(map);
		map.clear();
		map.put("start", 0);
		map.put("size", 7);
		List<Zyc> hotZycList = zycService.findByclick(map);
		map.clear();
		List<BigType> bigTypeList = bigTypeService.find(map);
		for (BigType bigType : bigTypeList) {
			map.put("bigTypeId", bigType.getId());
			map.put("start", 0);
			map.put("size", 12);
			bigType.setZycList(zycService.find(map));
		}		
		map.clear();
		List<Tag> tagList = tagService.find(map);*/		
		ModelAndView mav=new ModelAndView();
		mav.addObject("title", "万药斋");
		mav.addObject("mainPage", "index.jsp");
		/*mav.addObject("slideZycList", slideZycList);
		mav.addObject("hotZycList", hotZycList);
		mav.addObject("bigTypeList", bigTypeList);
		mav.addObject("tagList", tagList);*/
		mav.setViewName("mainTemp");
		return mav;
	}
}
