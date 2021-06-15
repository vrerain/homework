/*
 * StaffServiceImpl.java
 * author: vrerain
 * Date: 2021/6/15
 * explation: 服务实现层
*/
package com.gx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gx.dao.StaffMapper;
import com.gx.service.StaffService;
import com.gx.domain.Staff;

@Service("StaffService")
public class StaffServiceImpl implements StaffService {
	
	@Autowired
	private StaffMapper staffMapper;
	
	@Override
	public List<Staff> findAll() {
		return staffMapper.findAll();
	}
	
	@Override
	public void save(Staff staff) {
		//判断是添加还是修改
		if(staff.getId() != null){
		//修改
		staffMapper.update(staff);
		}else{
		//增加
		staffMapper.save(staff);
		}
	}
	
	@Override
	public Staff findStaffById(Integer id) {
		return staffMapper.findStaffById(id);
	}
	
	@Override
	public void deleteOneStaff(Integer id) {
		staffMapper.deleteOneStaff(id);
	}
	
	@Override
	public void deleteManyStaffs(Integer[] id) {
		staffMapper.deleteManyStaffs(id);
	}
	
	@Override
	public List<Staff> staffConditionalSearch(String number, String name) {
		return staffMapper.staffConditionalSearch(number, name);
	}
}
