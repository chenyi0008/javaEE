package com.example.springbootjsp.controller;


import com.example.springbootjsp.dao.UserDao;
import com.example.springbootjsp.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.AutoConfigureOrder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    UserDao userDao;

    @RequestMapping("/index")
    public String index() {
        return "index";
    }



    @PostMapping("/login")
    @ResponseBody
    public Map<String, Object> login(@RequestBody @Validated User user, HttpSession session) throws IOException {

        String username = user.getUsername();
        String password = user.getPassword();
        System.out.println(username);
        System.out.println(password);

        Map<String, Object> map = new HashMap<>();
        List<User> list = userDao.findByUsernameAndPassword(username, password);

        if(list.size()>= 1){
//            response.sendRedirect("success.jsp");
//            response.sendRedirect(request.getContextPath() + "/succeed.jsp");
            map.put("data", "succeed");
            session.setAttribute("token", "123");

        }else{
            map.put("data", "failed");
//            response.sendRedirect(request.getContextPath() + "/failed.jsp");
        }
        return map;

//        // 在实际应用中，你应该在这里进行用户验证
//        // 这里简单地演示用户名和密码是否匹配
//        if ("user123".equals(username) && "password123".equals(password)) {
//            // 登录成功，可以重定向到成功页面
//            response.sendRedirect("success.jsp");
//        } else {
//            // 登录失败，可以重定向到失败页面
//            response.sendRedirect("error.jsp");
//        }

//        return "succeed.jsp";
    }

    String token = "eyJhbGciOiJSUzI1NiJ9.eyJzdWIiOiIzIiwiYWNjb3VudCI6InJvb3QiLCJuYW1lIjoi5bmz5Y-w566h55CG5ZGYIiwib3JnaWQiOjEwMCwic3RhdGlvbmlkIjoxMDAsImV4cCI6MTcwMDM5ODE3Nn0.nb1TUIap6zra6yrjsyK9TeOJGNdUoSmI12JubLNQgkAaePkVLWYVCE-pxsDwaSRVBVrSrYA9ZPWVxkXKtgnIJLf7rgW-K5cE1Yo8zlJ30GDX-GFaDgQojTv5LJpxFJ5kdJVLaM-pCsDg8rsFNiNMZP9aQMApAtL23yGu8VogkSU";
}
