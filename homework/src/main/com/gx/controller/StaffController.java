/*
 * StaffController.java
 * author: vrerain
 * Date: 2021/6/15
 * explation: 控制层
*/
package com.gx.controller;

import com.gx.service.StaffService;

import java.io.IOException;
import java.io.OutputStream;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.transform.Result;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gx.domain.*;

@Controller
@RequestMapping("/")
public class StaffController {
	
	@Autowired
	private StaffService staffService;
	
	private Map<String, Object> result = new HashMap<String, Object>();
	
	
	/*
	*拦截/staffAdminister路由
	* @return 返回jsp页面的名称
	*/
	@RequestMapping("/staffAdminister")
	public String test(Model m)
	{
		return "staffAdminister";
	}
	
	/*
	*拦截/staffInformation路由，查询所有员工的信息，并且进行分页操作
	* @return 返回查询到的数据
	*/
	@RequestMapping("/staffInformation")
	@ResponseBody
	public Map<String, Object> informationByPage(Integer page, Integer rows) {
		PageHelper.startPage(page, rows);
		List<Staff> list = staffService.findAll();
		PageInfo<Staff> pageInfo = new PageInfo<Staff>(list);
		long total = pageInfo.getTotal();
		List<Staff> custList = pageInfo.getList();
		result.put("total", total);
		result.put("rows", custList);
		return result;
	}
	
	/*
	*拦截/saveStaffInformation路由，保存新添加员工的信息
	* @return 返回保存成功与否
	*/
	@RequestMapping("/saveStaffInformation")
	@ResponseBody
	public Map<String, Object> save(Staff staff) {
		try {
			staffService.save(staff);
			result.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("success", false);
			result.put("msg", e.getMessage());
		}
		
		return result;
	}
	
	/*
	*拦截/findStaffById路由，通过员工ID查询数据
	* @return 返回查到的数据
	*/
	@RequestMapping("/findStaffById")
	@ResponseBody
	public Staff findById(Integer id){
		Staff staff = staffService.findStaffById(id);
		return staff;
	}
	
	/*
	*拦截/deleteOneStaff路由，删除一个员工
	* @return 返回成功与否
	*/
	@RequestMapping("/deleteOneStaff")
	@ResponseBody
	public Map<String, Object> deleteOnestaff(Integer index) {
		int index2 = findById(index).getId();
		try {
			staffService.deleteOneStaff(index2);
			result.put("success", true);
		} catch (Exception e) {
			result.put("success", false);
			result.put("msg", e.getMessage());
		}
		return result;
	}
	
	/*
	*拦截/deleteManyStaffs路由，删除多个员工
	* @return 返回成功与否
	*/
	@RequestMapping("/deleteManyStaffs")
	@ResponseBody
	public Map<String,Object> deleteManyRoles(Integer[] id) {
		try {
			staffService.deleteManyStaffs(id);
			result.put("success", true);
		} catch (Exception e) {
		e.printStackTrace();
			result.put("success", false);
			result.put("msg", e.getMessage());
		}
		return result;
	}
	
	/*
	*拦截/staffConditionalSearch路由，查询指定ID和姓名的员工，即通过ID和姓名进行搜索
	* @return 返回搜索到的数据
	*/
	@RequestMapping("/staffConditionalSearch")
	@ResponseBody
	public Map<String, Object> staffConditionalSearch(String number,String name, Integer page,Integer rows){
		PageHelper.startPage(page,rows);
		List<Staff> list = staffService.staffConditionalSearch(number, name);
		PageInfo<Staff> pageInfo = new PageInfo<Staff>(list);
		long total = pageInfo.getTotal();
		List<Staff> cList = pageInfo.getList();
		result.put("total", total);
		result.put("rows", cList);
		return result;
	}
	
	
	
	
	   @RequestMapping("/staffDownloadExcel")
	    public void setUpExcel(HttpServletRequest request, HttpServletResponse response) throws IOException{
		    List<Staff> datasList = staffService.findAll();
		    HSSFWorkbook wb = new HSSFWorkbook();//创建HSSFWorkbook对象
		    HSSFSheet sheet=wb.createSheet("成绩表");//建立sheet对象
		    HSSFRow row1=sheet.createRow(0); //在sheet里创建第一行，参数为行索引
	        HSSFCell cell=row1.createCell(0); //创建单元格
            cell.setCellValue("员工信息表"); //设置单元格内容
	        sheet.addMergedRegion(new CellRangeAddress(0,0,0,6));
          //在sheet里创建第二行
	        HSSFRow row2=sheet.createRow(1);
            //创建单元格并设置单元格内容
			 row2.createCell(0).setCellValue("员工ID");
			 row2.createCell(1).setCellValue("姓名");
			 row2.createCell(2).setCellValue("年龄");
			 row2.createCell(3).setCellValue("工资级别");
			 row2.createCell(4).setCellValue("身体状况");
			 row2.createCell(5).setCellValue("家庭住址");
			 row2.createCell(6).setCellValue("联系电话");
			 for (int i = 0; i < datasList.size(); ++i) {
				 Staff sss = datasList.get(i);
				 HSSFRow row3=sheet.createRow(i + 2);
				 row3.createCell(0).setCellValue(sss.getNumber());
				 row3.createCell(1).setCellValue(sss.getName());
				 row3.createCell(2).setCellValue(sss.getAge());
				 row3.createCell(3).setCellValue(sss.getSalaryLevel());
				 row3.createCell(4).setCellValue(sss.getBodyStatus());
				 row3.createCell(5).setCellValue(sss.getAddress());
				 row3.createCell(6).setCellValue(sss.getPhone());
			 }
			 //输出Excel文件
			 OutputStream output=response.getOutputStream();
			 response.reset();
			 response.setHeader("Content-disposition", "attachment; filename=Staff.xls");
			 response.setContentType("application/msexcel"); 
			 wb.write(output);
			 output.close();
			 return ;
	    }
}
