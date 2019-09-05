package com.zl.zhb.Service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zl.zhb.Service.IUserService;
import com.zl.zhb.dao.UserDao;
import com.zl.zhb.pojo.User;



@Service
public class UserService implements IUserService {

	@Autowired
	private UserDao userDao;
	@Override
	public User findbyusername(String username) {
		// TODO Auto-generated method stub
		return userDao.findbyusername(username);
	}
	@Override
	public Boolean insertUser(User user) {
		// TODO Auto-generated method stub
		return userDao.insertUser(user);
	}

	
}
