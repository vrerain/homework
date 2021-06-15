/*
 * SimulateController.java
 * author: vrerain
 * Date: 2021/6/15
 * explation: 控制层
*/
package com.gx.controller;

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
public class SimulateController {
	
	/*
	*拦截/simulate路由
	* @return 返回jsp页面的名称
	*/
	@RequestMapping("/simulate")
	public String test()
	{
		return "simulate";
	}
	
//	编写打卡机模拟信息提交的路由
	
}
