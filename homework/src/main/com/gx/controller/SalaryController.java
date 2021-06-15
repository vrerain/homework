package com.gx.controller;

import com.gx.service.AttendanceService;
import com.gx.service.SalaryService;
import com.gx.service.TestService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gx.domain.*;

@Controller
@RequestMapping("/")
public class SalaryController {
	
//	@Autowired
//	private SalaryService salaryService;
	
	/*
	*拦截/salaryAdminister路由
	* @return 返回jsp页面的名称
	*/
	@RequestMapping("/salaryAdminister")
	public String test()
	{
		return "salaryAdminister";
	}
	
	
//	编写工资管理控制层代码
	
}
