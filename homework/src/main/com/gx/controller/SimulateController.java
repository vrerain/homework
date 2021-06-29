/*
 * SimulateController.java
 * author: vrerain
 * Date: 2021/6/15
 * explation: 控制层
*/
package com.gx.controller;

import com.gx.service.SimulateService;
import com.gx.service.StaffService;
import com.gx.service.TestService;

import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gx.domain.*;

@Controller
@RequestMapping("/")
public class SimulateController {
	
	@Autowired
	private SimulateService simulateService;
	
	private Map<String, Object> result = new HashMap<String, Object>();
	
	/*
	*拦截/simulate路由
	* @return 返回jsp页面的名称
	*/
	@RequestMapping("/simulate")
	public String test()
	{
		return "simulate";
	}
	
	@RequestMapping("/uploadAttendance")
	public String simulate(String number, String machineID, String startTime, String endTime) {
		int minutes = (Integer.valueOf(endTime.substring(0,2)) - Integer.valueOf(startTime.substring(0, 2))) * 60 
				+ Integer.valueOf(endTime.substring(3,endTime.length())) - Integer.valueOf(startTime.substring(3,startTime.length()));
		int areaID = (Integer.valueOf(machineID)+1) / 2;
//		System.out.println(date.toString());
		Date date = new Date();
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
//        SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm");
//        System.out.println(sdf1.formate(data))
        Simulate s1 = new Simulate(number, Integer.valueOf(machineID), sdf1.format(date), startTime, endTime, areaID, minutes);
        simulateService.save(s1);
		return "simulate";
	}
	
	@RequestMapping("/simulateInformation")
	@ResponseBody
	public Map<String, Object> simulateInformation(Integer page, Integer rows) {
		PageHelper.startPage(page, rows);
		List<Simulate2> list = simulateService.findAll();
		PageInfo<Simulate2> pageInfo = new PageInfo<Simulate2>(list);
		long total = pageInfo.getTotal();
		List<Simulate2> custList = pageInfo.getList();
		result.put("total", total);
		result.put("rows", custList);
		return result;
	}
	

	@RequestMapping("/simulateDownloadExcel")
	public void simulateDownloadExcel(HttpServletRequest request, HttpServletResponse response) throws IOException {
		List<Simulate2> datasList = simulateService.findAll();
		HSSFWorkbook wb = new HSSFWorkbook();//创建HSSFWorkbook对象
	    HSSFSheet sheet=wb.createSheet("成绩表");//建立sheet对象
	    HSSFRow row1=sheet.createRow(0); //在sheet里创建第一行，参数为行索引
        HSSFCell cell=row1.createCell(0); //创建单元格
        cell.setCellValue("考勤信息表"); //设置单元格内容
        sheet.addMergedRegion(new CellRangeAddress(0,0,0,7));
      //在sheet里创建第二行
        HSSFRow row2=sheet.createRow(1);
        //创建单元格并设置单元格内容
		 row2.createCell(0).setCellValue("员工ID");
		 row2.createCell(1).setCellValue("姓名");
		 row2.createCell(2).setCellValue("打卡机编号");
		 row2.createCell(3).setCellValue("打卡日期");
		 row2.createCell(4).setCellValue("签到时间");
		 row2.createCell(5).setCellValue("签退时间");
		 row2.createCell(6).setCellValue("区域编号");
		 row2.createCell(7).setCellValue("单次时长");
		 for (int i = 0; i < datasList.size(); ++i) {
			 Simulate2 sss = datasList.get(i);
			 HSSFRow row3=sheet.createRow(i + 2);
			 row3.createCell(0).setCellValue(sss.getNumber());
			 row3.createCell(1).setCellValue(sss.getName());
			 row3.createCell(2).setCellValue(sss.getMachineID());
			 row3.createCell(3).setCellValue(sss.getAttendanceDate());
			 row3.createCell(4).setCellValue(sss.getStartTime());
			 row3.createCell(5).setCellValue(sss.getEndTime());
			 row3.createCell(6).setCellValue(sss.getAreaID());
			 row3.createCell(7).setCellValue(sss.getMinutes());
		 }
		 //输出Excel文件
		 OutputStream output=response.getOutputStream();
		 response.reset();
		 response.setHeader("Content-disposition", "attachment; filename=attendance.xls");
		 response.setContentType("application/msexcel"); 
		 wb.write(output);
		 output.close();
		return ;
	}
	
}
