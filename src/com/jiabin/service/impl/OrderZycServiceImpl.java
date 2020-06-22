package com.jiabin.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jiabin.dao.OrderZycDao;
import com.jiabin.entity.OrderZyc;
import com.jiabin.service.OrderZycService;

@Service("orderZycService")
public class OrderZycServiceImpl implements OrderZycService{
	
	@Resource
	private OrderZycDao orderZycDao;

	public List<OrderZyc> find(Map<String, Object> map) {
		return orderZycDao.find(map);
	}

	public Long getTotal(Map<String, Object> map) {
		return orderZycDao.getTotal(map);
	}

	public int update(OrderZyc orderZyc) {
		return orderZycDao.update(orderZyc);
	}

	public int add(OrderZyc orderZyc) {
		return orderZycDao.add(orderZyc);
	}

	public int addByBatch(List<OrderZyc> orderZycList) {
		return orderZycDao.addByBatch(orderZycList);
	}

	public int delete(Integer id) {
		return orderZycDao.delete(id);
	}

	public OrderZyc findById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

}
