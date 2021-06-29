package com.gx.domain;

public class Salary {
	private String number;
	private String area1;
	private String area2;
	private String area3;
	private String areaSum;
	
	public Salary() {
	}

	public Salary(String number, String area1, String area2, String area3, String areaSum) {
		this.number = number;
		this.area1 = area1;
		this.area2 = area2;
		this.area3 = area3;
		this.areaSum = areaSum;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getArea1() {
		return area1;
	}

	public void setArea1(String area1) {
		this.area1 = area1;
	}

	public String getArea2() {
		return area2;
	}

	public void setArea2(String area2) {
		this.area2 = area2;
	}

	public String getArea3() {
		return area3;
	}

	public void setArea3(String area3) {
		this.area3 = area3;
	}

	public String getAreaSum() {
		return areaSum;
	}

	public void setAreaSum(String areaSum) {
		this.areaSum = areaSum;
	}
	
}
