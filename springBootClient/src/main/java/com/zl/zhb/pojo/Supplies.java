package com.zl.zhb.pojo;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;

@Data
public class Supplies implements Serializable{

	private Integer id;
	private String supplies_name;
	private Double size;
	private String quantity;
	private Double prize;
	private Double num;
	private Integer company_id;
	private Date date;
	private Integer delect;
	private Double start;
	private Double end;
}
