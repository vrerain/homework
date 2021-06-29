package com.gx.service;

import java.util.List;

import com.gx.domain.Simulate;
import com.gx.domain.Simulate2;
import com.gx.domain.Staff;

public interface SimulateService {

	public void save(Simulate simulate);
	public List<Simulate2> findAll();
	public List<Simulate> findByNumber(String number);
}
