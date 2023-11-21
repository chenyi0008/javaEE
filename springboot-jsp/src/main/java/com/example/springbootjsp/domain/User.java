package com.example.springbootjsp.domain;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

public class User {
    @NotBlank(message = "username不能为空")
    @Size(min = 3, max = 50, message = "username必须在3-50个字符之间")
    String username;

    @NotBlank(message = "password不能为空")
    @Size(min = 3, max = 50, message = "password必须在3-50个字符之间")
    String password;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
