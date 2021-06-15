package com.gx.controller;

import com.gx.service.AttendanceService;
import com.gx.service.IndexService;
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
public class IndexController {
	
//	@Autowired
//	private IndexService indexService;
	
	/*
	*拦截/salaryAdminister路由
	* @return 返回jsp页面的名称
	*/
	@RequestMapping("/index")
	public String test()
	{
		return "index";
	}
	
	
//	编写主页控制层代码
	
}
