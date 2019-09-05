package com.zl.zhb.Service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zl.zhb.Service.ICompanyService;
import com.zl.zhb.dao.CompanyDao;
import com.zl.zhb.pojo.Company;

@Service
public class CompanyService implements ICompanyService {

	@Autowired
	private CompanyDao companyDao;
	@Override
	public Company findbyid(int id) {
		// TODO Auto-generated method stub
		return companyDao.findbyid(id);
	}
	@Override
	public List<Company> findall() {
		return companyDao.findall();
		// TODO Auto-generated method stub
	
	}

}
