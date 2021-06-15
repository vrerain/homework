package com.gx.domain;

public class User {
	private String account;
	private String name;
	private String password;
	private Integer serialNumber;
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Integer getSerialNumber() {
		return serialNumber;
	}
	public void setSerialNumber(Integer serialNumber) {
		this.serialNumber = serialNumber;
	}
	@Override
	public String toString() {
		return "User [account=" + account + ", name=" + name + ", password=" + password + ", serialNumber="
				+ serialNumber + "]";
	}
	
	
}
