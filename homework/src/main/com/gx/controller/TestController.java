/*
 * TestController.java
 * author: vrerain
 * Date: 2021/5/19
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
public class TestController {
	
	@Autowired
	private TestService testService;
	
	/*
	*拦截/test路由，查数据，然后利用Model传递到前端
	* @param m 进行参数的传递
	* @return 返回jsp页面的名称
	*/
	@RequestMapping("/test")
	public String test(Model m)
	{
		List<Test> result = testService.findAll();
		m.addAttribute("allInf", result);
		return "test";
	}

}
