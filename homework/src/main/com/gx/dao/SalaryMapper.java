package com.gx.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gx.domain.*;

public interface SalaryMapper {
//	编写工资管理dao层代码
	public List<Simulate> findAll();
	public Simulate findSalaryById(Integer id);
	public List<Simulate> salaryConditionalSearch(@Param("number") String number,@Param("month") String month);
}
