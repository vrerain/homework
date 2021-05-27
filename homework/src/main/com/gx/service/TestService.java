/*
 * TestService.java
 * author: vrerain
 * Date: 2021/5/19
 * explation: 服务层
*/
package com.gx.service;

import java.util.List;

import com.gx.domain.*;

public interface TestService {
	
//	服务层接口，查找所有数据
	public List<Test> findAll();
}
