package com.gx.domain;

public class Simulate2 {
	
	private String number;
	private String name;
	private Integer machineID;
	private String attendanceDate;
	private String startTime;
	private String endTime;
	private Integer areaID;
	private Integer minutes;
	
	
	
	public Simulate2() {
	}
	public Simulate2(String number, String name, Integer machineID, String attendanceDate, String startTime,
			String endTime, Integer areaID, Integer minutes) {
		super();
		this.number = number;
		this.name = name;
		this.machineID = machineID;
		this.attendanceDate = attendanceDate;
		this.startTime = startTime;
		this.endTime = endTime;
		this.areaID = areaID;
		this.minutes = minutes;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getMachineID() {
		return machineID;
	}
	public void setMachineID(Integer machineID) {
		this.machineID = machineID;
	}
	public String getAttendanceDate() {
		return attendanceDate;
	}
	public void setAttendanceDate(String attendanceDate) {
		this.attendanceDate = attendanceDate;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public Integer getAreaID() {
		return areaID;
	}
	public void setAreaID(Integer areaID) {
		this.areaID = areaID;
	}
	public Integer getMinutes() {
		return minutes;
	}
	public void setMinutes(Integer minutes) {
		this.minutes = minutes;
	}
	
	
}
