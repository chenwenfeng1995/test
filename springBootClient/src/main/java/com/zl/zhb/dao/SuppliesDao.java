package com.zl.zhb.dao;

import java.util.HashMap;
import java.util.List;

import com.zl.zhb.pojo.Supplies;


public interface SuppliesDao {

	public List<Supplies> findall();
	
	public List<Supplies> findByPage(HashMap<String,Object> map);
	
	public Integer selectCount();
	
	public List<Supplies> findbyname(String name);
	
	public List<Supplies>checkbythreed(Supplies supplies);
	
}
