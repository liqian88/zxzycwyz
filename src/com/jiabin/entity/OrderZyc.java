package com.jiabin.entity;


public class OrderZyc {

	private int id; 
	private int num; 
	private Order order; 
	private Zyc zyc;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public Zyc getZyc() {
		return zyc;
	}
	public void setZyc(Zyc zyc) {
		this.zyc = zyc;
	} 
}
