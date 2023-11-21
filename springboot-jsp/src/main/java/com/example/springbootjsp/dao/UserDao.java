package com.example.springbootjsp.dao;

import com.example.springbootjsp.domain.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface UserDao {

    @Select("SELECT username, password FROM tb_user WHERE username = #{username} AND password = #{password}")
    List<User> findByUsernameAndPassword(@Param("username") String username, @Param("password") String password);

}
