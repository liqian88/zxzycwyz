package com.jiabin.service.impl;

import com.jiabin.dao.ShopCartDao;
import com.jiabin.entity.ShopCart;
import com.jiabin.service.ShopCartService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service("shopCartService")
public class ShopCartServiceImpl implements ShopCartService{

	@Resource
	private ShopCartDao shopcartDao;


	@Override
	public List<ShopCart> findByUid11(Integer id) {
		return shopcartDao.findByUid11(id);
	}



	public int update(ShopCart sc)
	{
		return shopcartDao.update(sc);
	};

	public int addcart11(ShopCart sc)
	{
		return shopcartDao.addcart11(sc);
	};

	public int delete(Integer id)
	{
		return shopcartDao.delete(id);
	};

	public ShopCart findById11(Integer id)
	{
		return shopcartDao.findById11(id);
	};
}
