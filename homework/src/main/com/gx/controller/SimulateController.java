/*
 * SimulateController.java
 * author: vrerain
 * Date: 2021/6/15
 * explation: 控制层
*/
package com.gx.controller;

import com.gx.service.SimulateService;
import com.gx.service.StaffService;
import com.gx.service.TestService;

import java.text.SimpleDateFormat;
import java.util.Date;
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
	
	@Autowired
	private SimulateService simulateService;
	
	/*
	*拦截/simulate路由
	* @return 返回jsp页面的名称
	*/
	@RequestMapping("/simulate")
	public String test()
	{
		return "simulate";
	}
	
	@RequestMapping("/uploadAttendance")
	public String simulate(String number, String machineID, String startTime, String endTime) {
		int minutes = (Integer.valueOf(endTime.substring(0,2)) - Integer.valueOf(startTime.substring(0, 2))) * 60 
				+ Integer.valueOf(endTime.substring(3,endTime.length())) - Integer.valueOf(startTime.substring(3,startTime.length()));
		int areaID = (Integer.valueOf(machineID)+1) / 2;
//		System.out.println(date.toString());
		Date date = new Date();
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
//        SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm");
//        System.out.println(sdf1.formate(data))
        Simulate s1 = new Simulate(number, Integer.valueOf(machineID), sdf1.format(date), startTime, endTime, areaID, minutes);
        simulateService.save(s1);
		return "simulate";
	}
}
