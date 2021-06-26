package com.gx.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gx.dao.SimulateMapper;
import com.gx.dao.StaffMapper;
import com.gx.domain.Simulate;
import com.gx.service.SimulateService;

@Service("SimulateService")
public class SimulateServiceImpl implements SimulateService {
	
	@Autowired
	private SimulateMapper simulateMapper;

	@Override
	public void save(Simulate simulate) {
		simulateMapper.save(simulate);
	}
}
