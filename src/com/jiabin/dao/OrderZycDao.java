package com.jiabin.dao;

import java.util.List;
import java.util.Map;

import com.jiabin.entity.OrderZyc;

public interface OrderZycDao {

	/**
	 * 
	 * @param map
	 * @return
	 */
	public List<OrderZyc> find(Map<String,Object> map);
	
	/**
	 * 
	 * @param map
	 * @return
	 */
	public Long getTotal(Map<String,Object> map);
	
	/**
	 * 
	 * @param orderZyc
	 * @return
	 */
	public int update(OrderZyc orderZyc);
	
	/**
	 * 
	 * @param orderZyc
	 * @return
	 */
	public int add(OrderZyc orderZyc);
	
	/**
	 * 
	 * @param orderZycList
	 * @return
	 */
	public int addByBatch(List<OrderZyc> orderZycList);
	
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
	public OrderZyc findById(Integer id);
}
