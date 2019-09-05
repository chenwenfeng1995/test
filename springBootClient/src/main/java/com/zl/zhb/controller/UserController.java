package com.zl.zhb.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.AutoConfigureBefore;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zl.zhb.Service.IUserService;
import com.zl.zhb.pojo.RestData;
import com.zl.zhb.pojo.User;



@Controller
@RequestMapping("user")
public class UserController {

	
	@Autowired
	private IUserService userServie;
	
	RestData restData=new RestData();
	
	@RequestMapping("findUserByUname")
	@ResponseBody
	public RestData findUserByUname(HttpServletRequest request,HttpServletResponse response) {
		String username=request.getParameter("username");
		System.out.println(username);
		User user=userServie.findbyusername(username);
		if (user==null) {
			restData.setSuccess("err");
			System.err.println(restData.getSuccess());
			restData.setMsg("用户名不存在,请重新输入!");;
		}
		return restData;
	}
	
	@RequestMapping("/login")
	@ResponseBody
	public RestData login(String username,String password) {
		User user=userServie.findbyusername(username);
		System.out.println(password);
		System.out.println();
		if (!user.getPassword().equals(password)) {
			restData.setSuccess("err");
			restData.setMsg("用户名或密码错误,请重新输入!");;
		}
		return restData;
	}
	@RequestMapping("/register")
	@ResponseBody
	public RestData register(User user) throws Exception {
		User u=userServie.findbyusername(user.getUsername());
		if (u!=null) {
			restData.setSuccess("err");
			System.err.println(restData.getSuccess());
			restData.setMsg("用户名已存在,请重新输入!");;
		}else {			
			
			Date date=new Date();
			//user.setId(10);
			user.setDate(date);
			user.setDelect(1);
			System.out.println(user.toString());
			userServie.insertUser(user);
		}
		return restData;
	}
}
