/*
 * UserMapper.java
 * author: vrerain
 * Date: 2021/6/15
 * explation: dao接口
*/
package com.gx.dao;

import com.gx.domain.*;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface UserMapper {

    public void insertUser(User user);
    public User userLogin(String account);
    public void modifyPassword(@Param("account") String account, @Param("password") String password);
}
