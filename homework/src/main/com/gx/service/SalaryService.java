package com.gx.service;

import java.util.List;
import com.gx.domain.*;

public interface SalaryService {
	// 编写工资管理服务层代码
	public List<Simulate> findAll();
	public Simulate findSalaryById(Integer id);
	public List<Simulate> salaryConditionalSearch(String number,String month);
}
