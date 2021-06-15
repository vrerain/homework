package com.gx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gx.dao.UserMapper;
import com.gx.service.UserService;
import com.gx.domain.User;

@Service("userServiece")
@Transactional
public class UserServiceImpl implements UserService {
    /* 注入Mapper对象 */

    @Autowired
    private UserMapper userMapper;

    @Override
    public void insertUser(User user) {
        userMapper.insertUser(user);
    }

    @Override
    public User userLogin(String account) {
        return userMapper.userLogin(account);
    }
}
