package com.chen.dao;

import com.chen.domain.Course;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface CourseDao {

    @Insert("insert into course (time,name,description) values(#{time},#{name},#{description})")
    public void save(Course course);

    @Update("update course set time = #{time}, name = #{name}, description = #{description} where id = #{id}")
    public void update(Course course);

    @Delete("delete from course where id = #{id}")
    public void delete(Integer id);

    @Select("select * from course where id = #{id}")
    public Course getById(Integer id);

    @Select("select * from course")
    public List<Course> getAll();
}
