package com.jiabin.controller.admin;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jiabin.entity.PageBean;
import com.jiabin.entity.Zyc;
import com.jiabin.service.ZycService;
import com.jiabin.util.ResponseUtil;
import com.jiabin.util.StringUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

@Controller
@RequestMapping("/admin/zyc")
public class ZycAdminController {

	@Resource
	private ZycService zycService;
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));   //true:���������ֵ��false:����Ϊ��ֵ
	}
	
	@RequestMapping("/list")
	public String list(Zyc s_zyc,
					   @RequestParam(value="page",required=false)String page,
					   @RequestParam(value="rows",required=false)String rows,
					   HttpServletResponse response)throws Exception{
		
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		map.put("name", StringUtil.formatLike(s_zyc.getName()));
		map.put("bieming", StringUtil.formatLike(s_zyc.getBieming()));
		map.put("xueming", StringUtil.formatLike(s_zyc.getXueming()));
		map.put("press", StringUtil.formatLike(s_zyc.getPress()));
		map.put("slide", s_zyc.getSlide());
		if (s_zyc.getSmallType()!=null) {
			map.put("bigTypeId", s_zyc.getSmallType().getId());
			if (s_zyc.getSmallType().getBigType()!=null) {
				map.put("bigTypeId", s_zyc.getSmallType().getBigType().getId());
			}
		}
		List<Zyc> zycList=zycService.find(map);
		JSONObject result=new JSONObject();
		JsonConfig jsonConfig=new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor("yyyy-MM-dd"));
		JSONArray jsonArray=JSONArray.fromObject(zycList,jsonConfig);
		Long total=zycService.getTotal(map);
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(response, result);
		return null;
	}
	
	@RequestMapping("/save")
	public String save(Zyc zyc,
					   @RequestParam(value = "file", required = false) MultipartFile file,
					   HttpServletResponse response,
					   HttpServletRequest request)throws Exception{
		
		String fileNameExt=file.getOriginalFilename();
		if (StringUtil.isNotEmpty(fileNameExt)) {
			String ext=fileNameExt.substring(fileNameExt.lastIndexOf(".")+1);
			String path = request.getSession().getServletContext().getRealPath("static/images/zyc/");
			String fileName = new Date().getTime()+"."+ext; 
			File targetFile = new File(path, fileName);
			zyc.setPic("static/images/zyc/"+fileName);
			if(!targetFile.exists()){  
	            targetFile.mkdirs();  
	        }
			//保存  
	        try {  
	            file.transferTo(targetFile);  
	        } catch (Exception e) {  
	            e.printStackTrace();  
	        }  
		}
		
		int resultTotal=0; // 操作的记录条数
		if(zyc.getId()==null){
			resultTotal=zycService.add(zyc);
		}else{
			zyc.setUpdateTime(new Date());
			resultTotal=zycService.update(zyc);
		}
		JSONObject result=new JSONObject();
		if(resultTotal>0){
			result.put("success", true);
		}else{
			result.put("success", false);
		}
		ResponseUtil.write(response, result);
		return null;
	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam(value="ids")String ids,HttpServletResponse response)throws Exception{
		String []idsStr=ids.split(",");
		for(int i=0;i<idsStr.length;i++){
			zycService.delete(Integer.parseInt(idsStr[i]));
		}
		JSONObject result=new JSONObject();
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null;
	}
	
	/**
	 * 通过Id查找实体
	 * @param id
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/findById")
	public String findById(@RequestParam(value="id")String id,HttpServletResponse response)throws Exception{
		Zyc zyc=zycService.findById(Integer.parseInt(id));
		JSONObject result=JSONObject.fromObject(zyc);
		ResponseUtil.write(response, result);
		return null;
	}
}
