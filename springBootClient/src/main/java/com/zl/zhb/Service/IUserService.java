package com.zl.zhb.Service;

import com.zl.zhb.pojo.User;

public interface IUserService {

	public User findbyusername(String username);
	
	public Boolean insertUser(User user);
}
