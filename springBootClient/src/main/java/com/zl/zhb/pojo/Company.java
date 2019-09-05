package com.zl.zhb.pojo;

import java.util.Date;

import lombok.Data;

@Data
public class Company {

	private Integer id;
	private String company_name;
	private String link_name;
	private String phone;
	private String place;
	private Date date;
	private Integer delect;
}
