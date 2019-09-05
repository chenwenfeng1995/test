package com.zl.zhb.pojo;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonAlias;
import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class User implements Serializable{

	private Integer id;
	private String username;
	private String password;
	private String name;
	private String sex;
	private Integer age;
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date date;
	private Integer delect;
	
	
}
