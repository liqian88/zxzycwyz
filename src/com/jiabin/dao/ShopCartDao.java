package com.jiabin.dao;


import com.jiabin.entity.ShopCart;

import java.util.List;
import java.util.Map;

public interface ShopCartDao {


	public List<ShopCart> findByUid11(Integer id);

	public int update(ShopCart sc);

	public int addcart11(ShopCart sc);

	public int delete(Integer id);

	public ShopCart findById11(Integer id);
}
