package com.zl.zhb.dao;

import com.zl.zhb.pojo.User;

public interface UserDao {

	public User findbyusername(String username);
	
	public Boolean insertUser(User user);
}
