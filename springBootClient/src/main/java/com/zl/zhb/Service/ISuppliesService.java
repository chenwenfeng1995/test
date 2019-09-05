package com.zl.zhb.Service;

import java.util.List;

import com.zl.zhb.pojo.PageBean;
import com.zl.zhb.pojo.Supplies;

public interface ISuppliesService {

	public List<Supplies> findall();
	
	public PageBean<Supplies> findByPage(int currentPage);
	
	public List<Supplies> findbyname(String name);
	
	public List<Supplies>checkbythreed(Supplies supplies);
}
