package com.gx.service;

import java.util.List;

import com.gx.domain.Attendance;

public interface AttendanceService {
// 编写考勤管理服务层代码
	public List<Attendance> attendanceInformationByWeek(String number, Integer week);
	public List<Attendance> attendanceInformationByMonth(String number, Integer m);
}
