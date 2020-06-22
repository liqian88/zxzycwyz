package com.jiabin.entity;

import java.util.ArrayList;
import java.util.List;

import com.jiabin.entity.ShoppingCartItem;

public class ShoppingCart {

	private int userId;
	private List<ShoppingCartItem> shoppingCartItems; //
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public List<ShoppingCartItem> getShoppingCartItems() {
		return shoppingCartItems;
	}
	public void setShoppingCartItems(List<ShoppingCartItem> shoppingCartItems) {
		this.shoppingCartItems = shoppingCartItems;
		//this.shoppingCartItems.addAll(shoppingCartItems);
	}

	@Override
	public String toString() {
		String str="";
		for (ShoppingCartItem sc : shoppingCartItems)
		{
			str+=sc.getId()+" "+sc.getZyc().getName()+" "+sc.getCount()+"    ";
		}
			return str;
	}
}
