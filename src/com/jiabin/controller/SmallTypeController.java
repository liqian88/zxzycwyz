package com.jiabin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jiabin.entity.SmallType;
import com.jiabin.entity.Zyc;
import com.jiabin.service.SmallTypeService;
import com.jiabin.service.ZycService;

@Controller
@RequestMapping("/smallType")
public class SmallTypeController {

	@Resource
	private SmallTypeService smallTypeService;
	
	@Resource
	private ZycService zycService;
	
	/**
	 * 图书小类主页
	 * @param id
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/{id}")
	public ModelAndView details(@PathVariable("id") Integer id,HttpServletRequest request)throws Exception{
		
		ModelAndView mav=new ModelAndView();
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("smallTypeId", id);
		SmallType smallType = smallTypeService.findById(id);
		List<Zyc> zycList = zycService.find(map);
		mav.addObject("title", "万药斋-"+smallType.getName());
		mav.addObject("smallType", smallType);
		mav.addObject("mainPage", "smallType.jsp");
		mav.addObject("zycList", zycList);
		mav.setViewName("mainTemp");
		return mav;
	}
}
