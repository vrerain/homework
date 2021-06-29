package com.gx.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gx.dao.SimulateMapper;
import com.gx.dao.StaffMapper;
import com.gx.domain.Simulate;
import com.gx.domain.Simulate2;
import com.gx.service.SimulateService;

@Service("SimulateService")
public class SimulateServiceImpl implements SimulateService {
	
	@Autowired
	private SimulateMapper simulateMapper;
	
	@Autowired
	private StaffMapper staffMapper;

	@Override
	public void save(Simulate simulate) {
		simulateMapper.save(simulate);
	}
	
	@Override
	public List<Simulate2> findAll() {
		List<Simulate> temp = simulateMapper.findAll();
		List<Simulate2> result = new ArrayList<>();
		for (Simulate s : temp) {
			String name = staffMapper.findNameByNumber(s.getNumber());
			result.add(new Simulate2(s.getNumber(), name, s.getMachineID(), s.getattendanceDate(), s.getStartTime(), s.getEndTime(), s.getAreaID(), s.getMinutes()));
		}
		return result;
	}
	
	@Override 
	public List<Simulate> findByNumber(String number) {
		return simulateMapper.findByNumber(number);
	}
}
