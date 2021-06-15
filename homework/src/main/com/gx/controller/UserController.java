package com.gx.controller;

import com.gx.service.UserService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.xml.transform.Result;

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
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/login")
    public String login() {
        return "login";
    }


    @RequestMapping("/insertUser")
    public void insertUser(User user, HttpServletResponse resp) throws Exception {
		userService.insertUser(user);
        resp.sendRedirect("/login");
    }

    @RequestMapping("/userLogin")
    public String userLogin(String account, String password, Model model) {
        User temp = userService.userLogin(account);
        if (temp == null || !temp.getPassword().equals(password)) {
        	return "login";
        } else {
            return "首页";
        }
    }
}
