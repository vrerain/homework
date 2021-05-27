/*
 * TestServiceImpl.java
 * author: vrerain
 * Date: 2021/5/19
 * explation: 服务实现层
*/
package com.gx.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gx.domain.*;
import java.util.*;
import com.gx.dao.TestMapper;
import com.gx.service.*;

@Service("testService")
public class TestServiceImpl implements TestService {
	
	@Autowired
	private TestMapper testMapper;
	
	/*
	*实现服务层的方法，查找所有数据
	* @return 返回通过dao接口查到的数据
	*/
	@Override
	public List<Test> findAll() {
		return testMapper.findAll();
	}
}
