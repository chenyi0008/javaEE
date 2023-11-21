package com.chen.service;

import com.chen.domain.Course;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
public interface CourseService {

    /**
     * 保存
     * @param course
     * @return
     */
    public boolean save(Course course);

    /**
     * 修改
     * @param course
     * @return
     */
    public boolean update(Course course);

    /**
     * 按id删除
     * @param id
     * @return
     */
    public boolean delete(Integer id);

    /**
     * 按id查询
     * @param id
     * @return
     */
    public Course getById(Integer id);

    /**
     * 查询全部
     * @return
     */
    public List<Course> getAll();
}
