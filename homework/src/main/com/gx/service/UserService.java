/*
 * UserService.java
 * author: vrerain
 * Date: 2021/6/15
 * explation: 服务层
*/
package com.gx.service;

import java.util.List;

import com.gx.domain.User;

public interface UserService {

    public void insertUser(User user);
    public User userLogin(String account);
}
