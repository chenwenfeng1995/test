package com.zl.zhb.Service;

import java.util.List;

import com.zl.zhb.pojo.Company;

public interface ICompanyService {

	public Company findbyid(int id);
	
	public List<Company>findall();
}
