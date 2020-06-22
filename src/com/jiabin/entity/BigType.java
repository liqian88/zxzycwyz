package com.jiabin.entity;

import java.util.ArrayList;
import java.util.List;

public class BigType {

	private Integer id;
	private String name;
	private String remarks;
	private List<SmallType> smallTypeList=new ArrayList<SmallType>(); 
	private List<Zyc> zycList=new ArrayList<Zyc>();
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public List<SmallType> getSmallTypeList() {
		return smallTypeList;
	}
	public void setSmallTypeList(List<SmallType> smallTypeList) {
		this.smallTypeList = smallTypeList;
	}
	public List<Zyc> getZycList() {
		return zycList;
	}
	public void setZycList(List<Zyc> zycList) {
		this.zycList = zycList;
	}
}
