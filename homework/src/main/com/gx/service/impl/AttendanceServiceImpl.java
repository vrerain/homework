package com.gx.service.impl;

import com.gx.service.AttendanceService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gx.dao.SimulateMapper;
import com.gx.dao.StaffMapper;
import com.gx.domain.*;


@Service("AttendanceService")
public class AttendanceServiceImpl implements AttendanceService {
	// 编写考勤管理服务层实现代码
	
	@Autowired
	private SimulateMapper simulateMapper;
	
	@Autowired
	private StaffMapper staffMapper;
	
	@Override
	public List<Attendance> attendanceInformationByWeek(String number, Integer week) {
		List<Simulate> list1 = simulateMapper.findByNumber(number);
		List<Attendance> result = new ArrayList<>();
		Map<String, Attendance> temp = new HashMap<>();
		for (Simulate s : list1) {
			String attDate = s.getattendanceDate();
			int tempWeek = (Integer.parseInt(attDate.substring(5, 7))-3) * 30 + Integer.parseInt(attDate.substring(8, 10)) - 1;
			tempWeek = tempWeek / 7 + 1;
			if (tempWeek == week) {
				String t = s.getNumber();
				if (temp.containsKey(t)) {
					int areaId = s.getAreaID();
					Attendance att = temp.get(t);
					switch(areaId) {
					case 1:
						att.setArea1Hour(att.getArea1Hour() + s.getMinutes());
						break;
					case 2:
						att.setArea2Hour(att.getArea2Hour() + s.getMinutes());
						break;
					case 3:
						att.setArea3Hour(att.getArea3Hour() + s.getMinutes());
						break;
					}
				} else {
					int areaId = s.getAreaID();
					String name = staffMapper.findNameByNumber(t);
					Attendance att = new Attendance(t, name, 0, 0, 0, 0);
					switch(areaId) {
					case 1:
						att.setArea1Hour(s.getMinutes());
						break;
					case 2:
						att.setArea2Hour(s.getMinutes());
						break;
					case 3:
						att.setArea3Hour(s.getMinutes());
						break;
					}
					temp.put(t, att);
				}
			}
		}
		for (String key : temp.keySet()) {
            Attendance value = temp.get(key);
            value.setTotalHour(value.getArea1Hour() + value.getArea2Hour() + value.getArea3Hour());
            result.add(value);
        }
		return result;
	}
	
	@Override
	public List<Attendance> attendanceInformationByMonth(String number, Integer month) {
		List<Simulate> list1 = simulateMapper.findByNumber(number);
		List<Attendance> result = new ArrayList<>();
		Map<String, Attendance> temp = new HashMap<>();
		for (Simulate s : list1) {
			String attDate = s.getattendanceDate();
			int tempMonth = Integer.parseInt(attDate.substring(5, 7));
			if (tempMonth == month) {
				String t = s.getNumber();
				if (temp.containsKey(t)) {
					int areaId = s.getAreaID();
					Attendance att = temp.get(t);
					switch(areaId) {
					case 1:
						att.setArea1Hour(att.getArea1Hour() + s.getMinutes());
						break;
					case 2:
						att.setArea2Hour(att.getArea2Hour() + s.getMinutes());
						break;
					case 3:
						att.setArea3Hour(att.getArea3Hour() + s.getMinutes());
						break;
					}
				} else {
					int areaId = s.getAreaID();
					String name = staffMapper.findNameByNumber(t);
					Attendance att = new Attendance(t, name, 0, 0, 0, 0);
					switch(areaId) {
					case 1:
						att.setArea1Hour(s.getMinutes());
						break;
					case 2:
						att.setArea2Hour(s.getMinutes());
						break;
					case 3:
						att.setArea3Hour(s.getMinutes());
						break;
					}
					temp.put(t, att);
				}
			}
		}
		for (String key : temp.keySet()) {
            Attendance value = temp.get(key);
            value.setTotalHour(value.getArea1Hour() + value.getArea2Hour() + value.getArea3Hour());
            result.add(value);
        }
		return result;
	}
}
