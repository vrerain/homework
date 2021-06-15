package com.gx.controller;

import com.gx.service.AttendanceService;
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
public class AttendanceController {
	
//	@Autowired
//	private AttendanceService attendanceService;
	
	/*
	*拦截/attendanceCount路由
	* @return 返回jsp页面的名称
	*/
	@RequestMapping("/attendanceCount")
	public String test()
	{
		return "attendanceCount";
	}
	
	
//	编写考勤管理控制层代码
	
}
