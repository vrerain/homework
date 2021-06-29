package com.gx.domain;

public class SalaryMonth {
	private String number;
	private String hours;
	private String areaSum;
	public SalaryMonth() {
		
	}
	public SalaryMonth(String number, String hours, String areaSum) {
		this.number = number;
		this.hours = hours;
		this.areaSum = areaSum;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getHours() {
		return hours;
	}
	public void setHours(String hours) {
		this.hours = hours;
	}
	public String getAreaSum() {
		return areaSum;
	}
	public void setAreaSum(String areaSum) {
		this.areaSum = areaSum;
	}
	
}
