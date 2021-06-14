package com.gx.dao;

import com.gx.domain.*;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface StaffMapper {
	public List<Staff> findAll();
	public void save(Staff Staff);
	public void update(Staff Staff);
	public Staff findStaffById(Integer id);
	public void deleteOneStaff(Integer id);
	public void deleteManyStaffs(Integer[] id);
	public List<Staff> staffConditionalSearch(@Param("number") String number, @Param("name") String name);
}
