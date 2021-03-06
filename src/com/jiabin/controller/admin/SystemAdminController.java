package com.jiabin.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.jiabin.entity.BigType;
import com.jiabin.entity.Zyc;
import com.jiabin.service.BigTypeService;
import com.jiabin.service.ZycService;
import com.jiabin.util.ResponseUtil;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/admin/system")
public class SystemAdminController {
	
	@Resource
	private ZycService zycService;
	
	@Resource
	private BigTypeService bigTypeService;
	

	/**
	 * 刷新系统缓存
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/refreshSystem")
	public String refreshSystem(HttpServletRequest request,HttpServletResponse response)throws Exception{
		ServletContext application=RequestContextUtils.getWebApplicationContext(request).getServletContext();
		
		Map<String,Object> map=new HashMap<String,Object>(); 
		
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
		
		application.setAttribute("slideZycList", slideZycList);
		application.setAttribute("hotZycList", hotZycList);
		application.setAttribute("bigTypeList", bigTypeList);
		
		JSONObject result=new JSONObject();
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null;
	}
}
