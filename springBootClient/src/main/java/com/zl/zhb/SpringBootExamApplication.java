package com.zl.zhb;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.zl.zhb.dao")

public class SpringBootExamApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringBootExamApplication.class, args);
	}

}
