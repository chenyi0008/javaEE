package com.example.springbootjsp.service.impl;

import com.example.springbootjsp.dao.CourseDao;
import com.example.springbootjsp.domain.Course;
import com.example.springbootjsp.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CourseServiceImpl implements CourseService {
    @Autowired
    private CourseDao courseDao;

    public boolean save(Course course) {
        courseDao.save(course);
        return true;
    }

    public boolean update(Course course) {
        courseDao.update(course);
        return true;
    }

    public boolean delete(Integer id) {
        courseDao.delete(id);
        return true;
    }

    public Course getById(Integer id) {
        return courseDao.getById(id);
    }

    public List<Course> getAll() {
        return courseDao.getAll();
    }
}
