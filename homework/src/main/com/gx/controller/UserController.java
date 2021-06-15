/*
 * UserController.java
 * author: vrerain
 * Date: 2021/6/15
 * explation: 控制层
*/
package com.gx.controller;

import com.gx.service.UserService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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

    /*
	*拦截/login路由
	* @return 返回jsp页面的名称
	*/
    @RequestMapping("/login")
    public String login() {
        return "login";
    }
    
    /*
	*拦截/personalCenter路由
	* @return 返回jsp页面的名称
	*/
    @RequestMapping("/personalCenter")
    public String personalCenter() {
        return "personalCenter";
    }
    
    
    /*
	*拦截/saveStaffInformation路由，保存新添加员工的信息
	* @return 返回保存成功与否
	*/
	@RequestMapping("/modifyPassword")
	@ResponseBody
	public Map<String, Object> modifyPassword(String password, HttpServletRequest req) {
		Map<String, Object> result = new HashMap<String, Object>();
		User user = (User) req.getSession().getAttribute("user"); 
		String account = user.getAccount();
		try {
			userService.modifyPassword(account, password);
			result.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("success", false);
			result.put("msg", e.getMessage());
		}
		
		return result;
	}



    /*
	*拦截/insertUser路由，插入用户信息，即实现用户注册功能
	*/
    @RequestMapping("/insertUser")
    public void insertUser(User user, HttpServletResponse resp) throws Exception {
		userService.insertUser(user);
        resp.sendRedirect("/login");
    }

    /*
   	*拦截/userLogin路由，实现用户登录的功能
   	* @return 根据登录成功与否返回不同的页面
   	*/
    @RequestMapping("/userLogin")
    public String userLogin(String account, String password, Model model, HttpServletRequest req) {
        User temp = userService.userLogin(account);
        if (temp == null || !temp.getPassword().equals(password)) {
        	return "login";
        } else {
        	req.getSession().setAttribute("user", temp);
            return "index";
        }
    }
}
