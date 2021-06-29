package com.gx.service.impl;

import com.gx.service.SalaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.gx.domain.*;
import java.util.*;
import com.gx.dao.SalaryMapper;

@Service("salaryService")
public class SalaryServiceImpl implements SalaryService {
	// 编写工资管理服务层实现代码
	@Autowired
	private SalaryMapper salaryMapper;

	@Override
	public List<Simulate> findAll() {
		return salaryMapper.findAll();
	}
	
	@Override
	public Simulate findSalaryById(Integer id) {
		return salaryMapper.findSalaryById(id);
	}
	
	@Override
	public List<Simulate> salaryConditionalSearch(String number,String month) {
		return salaryMapper.salaryConditionalSearch(number,month);
	}
	
}
