package com.gx.controller;

import com.gx.service.StaffService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.transform.Result;

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
public class StaffController {
	
	@Autowired
	private StaffService staffService;
	
	private Map<String, Object> result = new HashMap<String, Object>();
	
	@RequestMapping("/test2")
	public String test(Model m)
	{
		return "staffAdminister";
	}
	
	@RequestMapping("/staffInformation")
	@ResponseBody
	public Map<String, Object> informationByPage(Integer page, Integer rows) {
		PageHelper.startPage(page, rows);
		List<Staff> list = staffService.findAll();
		PageInfo<Staff> pageInfo = new PageInfo<Staff>(list);
		long total = pageInfo.getTotal();
		List<Staff> custList = pageInfo.getList();
		result.put("total", total);
		result.put("rows", custList);
		return result;
	}
	
	@RequestMapping("/saveStaffInformation")
	@ResponseBody
	public Map<String, Object> save(Staff staff) {
		try {
			staffService.save(staff);
			result.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("success", false);
			result.put("msg", e.getMessage());
		}
		
		return result;
	}
	
	@RequestMapping("/findStaffById")
	@ResponseBody
	public Staff findById(Integer id){
		Staff staff = staffService.findStaffById(id);
		return staff;
	}
	
	@RequestMapping("/deleteOneStaff")
	@ResponseBody
	public Map<String, Object> deleteOnestaff(Integer index) {
		int index2 = findById(index).getId();
		try {
			staffService.deleteOneStaff(index2);
			result.put("success", true);
		} catch (Exception e) {
			result.put("success", false);
			result.put("msg", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping("/deleteManyStaffs")
	@ResponseBody
	public Map<String,Object> deleteManyRoles(Integer[] id) {
		try {
			staffService.deleteManyStaffs(id);
			result.put("success", true);
		} catch (Exception e) {
		e.printStackTrace();
			result.put("success", false);
			result.put("msg", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping("/staffConditionalSearch")
	@ResponseBody
	public Map<String, Object> staffConditionalSearch(String number,String name, Integer page,Integer rows){
		PageHelper.startPage(page,rows);
		List<Staff> list = staffService.staffConditionalSearch(number, name);
		PageInfo<Staff> pageInfo = new PageInfo<Staff>(list);
		long total = pageInfo.getTotal();
		List<Staff> cList = pageInfo.getList();
		result.put("total", total);
		result.put("rows", cList);
		return result;
	}
}
