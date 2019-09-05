package com.zl.zhb.dao;

import java.util.List;

import com.zl.zhb.pojo.Company;

public interface CompanyDao {

	public Company findbyid(int id);
	
	public List<Company>findall();
}
