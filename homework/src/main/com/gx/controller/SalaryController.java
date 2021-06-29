package com.gx.controller;

import com.gx.service.AttendanceService;
import com.gx.service.SalaryService;
import com.gx.service.TestService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.ArrayList;

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
public class SalaryController {
	
	@Autowired
	private SalaryService salaryService;
	
	private Map<String, Object> result = new HashMap<String, Object>();
	
	/*
	*拦截/salaryAdminister路由
	* @return 返回jsp页面的名称
	*/
	@RequestMapping("/salaryAdminister")
	public String test(Model m)
	{
		return "salaryAdminister";
	}
	
	/*
	*拦截/salaryInformation路由，查询所有员工的信息，并且进行分页操作
	* @return 返回查询到的数据
	*/
	@RequestMapping("/salaryInformation")
	@ResponseBody
	public Map<String, Object> informationByPage(Integer page, Integer rows) {
		PageHelper.startPage(page, rows);
		List<Simulate> list = salaryService.findAll();
		PageInfo<Simulate> pageInfo = new PageInfo<>(list);
		long total = pageInfo.getTotal();
		List<Simulate> custList = pageInfo.getList();
		result.put("total", total);
		result.put("rows", custList);
		return result;
	}
	
	/*
	*拦截/findSalaryById路由，通过员工ID查询数据
	* @return 返回查到的数据
	*/
	@RequestMapping("/findSalaryById")
	@ResponseBody
	public Simulate findById(Integer id){
		Simulate simulate = salaryService.findSalaryById(id);
		return simulate;
	}
	
	/*
	*拦截/salaryConditionalSearch路由，查询指定ID和月份的员工，即通过ID和月份进行搜索
	* @return 返回搜索到的数据
	*/
	@RequestMapping("/salaryConditionalSearch")
	@ResponseBody
	public Map<String, Object> salaryConditionalSearch(String number,String month,Integer page,Integer rows){
		PageHelper.startPage(page,rows);
		List<Simulate> list = salaryService.salaryConditionalSearch(number,month);
		Integer area1=0,area2=0,area3=0;
		for(int i=0;i<list.size();i++) {
			switch(list.get(i).getMachineID()) {
			case 1:
				area1+=1;
				break;
			case 2:
				area2+=1;
				break;
			case 3:
				area3+=1;
				break;
		}
		}
		area1=area1*100;
		area2=area2*120;
		area3=area3*150;
		Integer areaSum=area1+area2+area3;
		Salary salary=new Salary(number,area1.toString(),area2.toString(),area3.toString(),areaSum.toString());
		List<Salary> list1=new ArrayList<Salary>();
		list1.add(salary);
		PageInfo<Salary> pageInfo = new PageInfo<Salary>(list1);
		long total = pageInfo.getTotal();
		List<Salary> cList = pageInfo.getList();
		result.put("total", total);
		result.put("rows", cList);
		System.out.println(result);
		return result;
	}
	
	/*
	*拦截/salarySearch路由，查询指定ID和月份的员工，即通过ID和月份进行搜索
	* @return 返回搜索到的数据
	*/
	@RequestMapping("/salarySearch")
	@ResponseBody
	public Map<String, Object> salarySearch(String number,String month,Integer page,Integer rows){
		PageHelper.startPage(page,rows);
		List<Simulate> list = salaryService.salaryConditionalSearch(number,month);
		Integer area1=0,area2=0,area3=0,minutes=0;
		for(int i=0;i<list.size();i++) {
			minutes+=list.get(i).getMinutes();
			switch(list.get(i).getMachineID()) {
			case 1:
				area1+=1;
				break;
			case 2:
				area2+=1;
				break;
			case 3:
				area3+=1;
				break;
		}
		}
		minutes=minutes/60;
		Integer areaSum=100*area1+120*area2+150*area3;
		SalaryMonth salarymonth=new SalaryMonth(number,minutes.toString(),areaSum.toString());
		List<SalaryMonth> list1=new ArrayList<SalaryMonth>();
		list1.add(salarymonth);
		PageInfo<SalaryMonth> pageInfo = new PageInfo<SalaryMonth>(list1);
		long total = pageInfo.getTotal();
		List<SalaryMonth> cList = pageInfo.getList();
		result.put("total", total);
		result.put("rows", cList);
		System.out.println(result);
		return result;
	}
}
