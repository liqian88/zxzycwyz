package com.jiabin.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jiabin.dao.ZycDao;
import com.jiabin.entity.Zyc;
import com.jiabin.service.ZycService;

@Service("zycService")
public class ZycServiceImpl implements ZycService{
	
	@Resource
	private ZycDao zycDao;

	public List<Zyc> find(Map<String, Object> map) {
		return zycDao.find(map);
	}

	public Long getTotal(Map<String, Object> map) {
		return zycDao.getTotal(map);
	}

	public int update(Zyc zyc) {
		return zycDao.update(zyc);
	}

	public int add(Zyc zyc) {
		return zycDao.add(zyc);
	}

	public int delete(Integer id) {
		return zycDao.delete(id);
	}

	public Zyc findById(Integer id) {
		return zycDao.findById(id);
	}

	public List<Zyc> findByclick(Map<String, Object> map) {
		return zycDao.findByclick(map);
	}

}
