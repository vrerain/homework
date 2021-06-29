package com.gx.controller;

import com.gx.service.AttendanceService;
import com.gx.service.TestService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gx.domain.*;

@Controller
@RequestMapping("/")
public class AttendanceController {
	
	@Autowired
	private AttendanceService attendanceService;
	
	private Map<String, Object> result = new HashMap<String, Object>();
	
	/*
	*拦截/attendanceCount路由
	* @return 返回jsp页面的名称
	*/
	@RequestMapping("/attendanceCount")
	public String test()
	{
		return "attendanceCount";
	}
	
	
	
	@RequestMapping("/attendanceInformationByWeek")
	@ResponseBody
	public Map<String, Object> attendanceInformationByWeek(String number,String week, Integer page,Integer rows){
		PageHelper.startPage(page,rows);
		List<Attendance> list = attendanceService.attendanceInformationByWeek(number, Integer.parseInt(week));
		PageInfo<Attendance> pageInfo = new PageInfo<Attendance>(list);
		long total = pageInfo.getTotal();
		List<Attendance> cList = pageInfo.getList();
		result.put("total", total);
		result.put("rows", cList);
		return result;
	}
	
	@RequestMapping("/attendanceInformationByMonth")
	@ResponseBody
	public Map<String, Object> attendanceInformationByMonth(String number,String month, Integer page,Integer rows){
		PageHelper.startPage(page,rows);
		List<Attendance> list = attendanceService.attendanceInformationByMonth(number, Integer.parseInt(month));
		PageInfo<Attendance> pageInfo = new PageInfo<Attendance>(list);
		long total = pageInfo.getTotal();
		List<Attendance> cList = pageInfo.getList();
		result.put("total", total);
		result.put("rows", cList);
		return result;
	}
//	编写考勤管理控制层代码
	
}
