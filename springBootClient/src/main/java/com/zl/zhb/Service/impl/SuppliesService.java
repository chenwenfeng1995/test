package com.zl.zhb.Service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zl.zhb.Service.ISuppliesService;
import com.zl.zhb.dao.CompanyDao;
import com.zl.zhb.dao.SuppliesDao;
import com.zl.zhb.pojo.Main;
import com.zl.zhb.pojo.PageBean;
import com.zl.zhb.pojo.Supplies;

@Service
public class SuppliesService implements ISuppliesService{

	@Autowired
	private SuppliesDao suppliesDao;
	@Autowired
	private CompanyDao companyDao;
	@Override
	public List<Supplies> findall() {
		// TODO Auto-generated method stub
		return suppliesDao.findall();
	}

	@Override
	public PageBean<Supplies> findByPage(int currentPage) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		PageBean<Supplies> pageBean = new PageBean<Supplies>();
		
	    //封装当前页数
        pageBean.setCurrPage(currentPage);
        
		//每页显示的数据
		int pageSize=5;
		pageBean.setPageSize(pageSize);
		
		//封装总记录数
		int totalCount = suppliesDao.selectCount();
		pageBean.setTotalCount(totalCount);
		
		//封装总页数
		double tc = totalCount;
        Double num =Math.ceil(tc/pageSize);//向上取整
        pageBean.setTotalPage(num.intValue());
      
		map.put("start",(currentPage-1)*pageSize);
		map.put("size", pageBean.getPageSize());
		//封装每页显示的数据
		List<Main> lists = new ArrayList<Main>() ;
		
		List<Supplies> supplies=suppliesDao.findByPage(map);
	    int i=0;
		for (Supplies supplies2 : supplies) {
			Main main=new Main();
			main.setId(supplies2.getId());
			main.setSupplies_name(supplies2.getSupplies_name());
			main.setNum(supplies2.getNum());
			main.setPrize(supplies2.getPrize());
			main.setSize(supplies2.getSize());
			main.setCompany_name(companyDao.findbyid(supplies2.getCompany_id()).getCompany_name());
			lists.add(main);
			
		}
		pageBean.setLists(lists);
		
		return pageBean;
	}

	@Override
	public List<Supplies> findbyname(String name) {
		// TODO Auto-generated method stub
		return suppliesDao.findbyname(name);
	}

	@Override
	public List<Supplies> checkbythreed(Supplies supplies) {
		// TODO Auto-generated method stub
		return suppliesDao.checkbythreed(supplies);
	}
}
