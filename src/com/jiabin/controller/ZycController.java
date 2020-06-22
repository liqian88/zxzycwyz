package com.jiabin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jiabin.entity.Zyc;
import com.jiabin.service.ZycService;
import com.jiabin.util.StringUtil;

@Controller
@RequestMapping("/zyc")
public class ZycController {

	@Resource
	private ZycService zycService;
	
	/**
	 * 显示中药材详细信息
	 * @param id
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/{id}")
	public ModelAndView details(@PathVariable("id") Integer id,HttpServletRequest request)throws Exception{
		ModelAndView mav=new ModelAndView();
		Zyc zyc = zycService.findById(id);
		zyc.setClick(zyc.getClick()+1);
		zycService.update(zyc);
		mav.addObject("title", "万药斋-"+zyc.getName());
		mav.addObject("mainPage", "zyc.jsp");
		mav.addObject("zyc", zyc);
		mav.setViewName("mainTemp");
		return mav;
	}
	
	@RequestMapping("/list")
	public ModelAndView list(Zyc s_zyc,HttpServletRequest request,HttpServletResponse response)throws Exception{
		ModelAndView mav=new ModelAndView();
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("name", StringUtil.formatLike(s_zyc.getName()));
		List<Zyc> zycList = zycService.find(map);
		mav.addObject("zycList", zycList);
		mav.addObject("mainPage","searchResult.jsp");
		mav.addObject("s_zyc", s_zyc);
		mav.setViewName("mainTemp");
		return mav;
	}
}
