package com.gx.dao;

import com.gx.domain.*;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface UserMapper {

    public void insertUser(User user);
    public User userLogin(String account);
}
