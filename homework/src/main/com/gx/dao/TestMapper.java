/*
 * TestMapper.java
 * author: vrerain
 * Date: 2021/5/19
 * explation: dao接口
*/
package com.gx.dao;

import java.util.List;
import com.gx.domain.*;

public interface TestMapper {
	
//	查找所有数据
	public List<Test> findAll();

}
