/*
 * Test.java
 * author: vrerain
 * Date: 2021/6/14
 * explation: 员工实体
*/
package com.gx.domain;

public class Staff {
	private Integer id;
	private String number;
	private String name;
	private Integer age;
	private String salaryLevel;
	private String bodyStatus;
	private String address;
	private String phone;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public String getSalaryLevel() {
		return salaryLevel;
	}
	public void setSalaryLevel(String salaryLevel) {
		this.salaryLevel = salaryLevel;
	}
	public String getBodyStatus() {
		return bodyStatus;
	}
	public void setBodyStatus(String bodyStatus) {
		this.bodyStatus = bodyStatus;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	@Override
	public String toString() {
		return "Staff [id=" + id + ", number=" + number + ", name=" + name + ", age=" + age + ", salaryLevel="
				+ salaryLevel + ", bodyStatus=" + bodyStatus + ", address=" + address + ", phone=" + phone + "]";
	}
	
	
	
}
