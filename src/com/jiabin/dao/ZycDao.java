package com.jiabin.dao;

import java.util.List;
import java.util.Map;

import com.jiabin.entity.Zyc;

public interface ZycDao {

	/**
	 * 
	 * @param map
	 * @return
	 */
	public List<Zyc> find(Map<String,Object> map);
	
	/**
	 * 
	 * @param map
	 * @return
	 */
	public Long getTotal(Map<String,Object> map);
	
	/**
	 * 
	 * @param map
	 * @return
	 */
	public List<Zyc> findByclick(Map<String,Object> map);
	
	/**
	 * 
	 * @param zyc
	 * @return
	 */
	public int update(Zyc zyc);
	
	/**
	 * 
	 * @param zyc
	 * @return
	 */
	public int add(Zyc zyc);
	
	/**
	 * 
	 * @param id
	 * @return
	 */
	public int delete(Integer id);
	
	/**
	 * 
	 * @param id
	 * @return
	 */
	public Zyc findById(Integer id);
}
