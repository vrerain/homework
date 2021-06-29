package com.gx.domain;

public class Attendance {
	private String number;
	private String name;
	private Integer area1Hour;
	private Integer area2Hour;
	private Integer area3Hour;
	private Integer totalHour;
	
	public Attendance() {
	}
	public Attendance(String number, String name, Integer area1Hour, Integer area2Hour, Integer area3Hour,
			Integer totalHour) {
		super();
		this.number = number;
		this.name = name;
		this.area1Hour = area1Hour;
		this.area2Hour = area2Hour;
		this.area3Hour = area3Hour;
		this.totalHour = totalHour;
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
	public Integer getArea1Hour() {
		return area1Hour;
	}
	public void setArea1Hour(Integer area1Hour) {
		this.area1Hour = area1Hour;
	}
	public Integer getArea2Hour() {
		return area2Hour;
	}
	public void setArea2Hour(Integer area2Hour) {
		this.area2Hour = area2Hour;
	}
	public Integer getArea3Hour() {
		return area3Hour;
	}
	public void setArea3Hour(Integer area3Hour) {
		this.area3Hour = area3Hour;
	}
	public Integer getTotalHour() {
		return totalHour;
	}
	public void setTotalHour(Integer totalHour) {
		this.totalHour = totalHour;
	}
	
	
}
