package com.jiabin.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

import com.jiabin.entity.BigType;
import com.jiabin.entity.Zyc;
import com.jiabin.service.BigTypeService;
import com.jiabin.service.ZycService;

@Component
public class InitComponent implements ServletContextListener,ApplicationContextAware{
	
	private static ApplicationContext applicationContext;

	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		this.applicationContext=applicationContext;
	}

	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		
	}

	public void contextInitialized(ServletContextEvent sce) {
		ServletContext application=sce.getServletContext();
		ZycService zycService=(ZycService) applicationContext.getBean("zycService");
		BigTypeService bigTypeService=(BigTypeService) applicationContext.getBean("bigTypeService");
		
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
	}

}
