package com.gx.dao;

import com.gx.domain.*;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface SimulateMapper {
	public void save(Simulate simulate);
	public List<Simulate> findAll();
	public List<Simulate> findByNumber(String number);
	public List<Simulate> findByDate(String date);
}
