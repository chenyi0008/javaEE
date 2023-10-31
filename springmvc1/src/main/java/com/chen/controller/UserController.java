package com.chen.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@RestController
@RequestMapping("")
public class UserController {

    @GetMapping("/user/register")
    public String register(){
            return "{'info':'springmvc'}";
    }
//    @ResponseBody
    @PostMapping("/user/login")
    public String login(HttpServletRequest request, HttpServletResponse  response) throws IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        System.out.println(username);
        System.out.println(password);

        if(username.equals("admin") && password.equals("admin")){
//            response.sendRedirect("success.jsp");
            response.sendRedirect(request.getContextPath() + "/succeed.jsp");
        }else{
            response.sendRedirect(request.getContextPath() + "/failed.jsp");
        }

//        // 在实际应用中，你应该在这里进行用户验证
//        // 这里简单地演示用户名和密码是否匹配
//        if ("user123".equals(username) && "password123".equals(password)) {
//            // 登录成功，可以重定向到成功页面
//            response.sendRedirect("success.jsp");
//        } else {
//            // 登录失败，可以重定向到失败页面
//            response.sendRedirect("error.jsp");
//        }

        return "succeed.jsp";
    }

}
