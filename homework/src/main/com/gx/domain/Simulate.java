package com.gx.domain;


public class Simulate {
	private Integer id;
	private String number;
	private Integer machineID;
	private String attendanceDate;
	private String startTime;
	private String endTime;
	private Integer areaID;
	private Integer minutes;
	
	
	
	public Simulate(String number, Integer machineID, String attendanceDate, String startTime, String endTime, Integer areaID,
			Integer minutes) {
		this.number = number;
		this.machineID = machineID;
		this.attendanceDate = attendanceDate;
		this.startTime = startTime;
		this.endTime = endTime;
		this.areaID = areaID;
		this.minutes = minutes;
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public Integer getMachineID() {
		return machineID;
	}
	public void setMachineID(Integer machineID) {
		this.machineID = machineID;
	}
	public String getattendanceDate() {
		return attendanceDate;
	}
	public void setattendanceDate(String attendanceDate) {
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
