/*
 * StaffService.java
 * author: vrerain
 * Date: 2021/6/15
 * explation: 服务层
*/
package com.gx.service;

import java.util.List;

import com.gx.domain.Staff;

public interface StaffService {
	public List<Staff> findAll();
	public void save(Staff role);
	public Staff findStaffById(Integer id);
	public void deleteOneStaff(Integer id);
	public void deleteManyStaffs(Integer[] id);
	public List<Staff> staffConditionalSearch(String number, String name);
}
