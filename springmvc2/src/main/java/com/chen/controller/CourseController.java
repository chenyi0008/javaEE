package com.chen.controller;

import com.chen.domain.Course;
import com.chen.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/course")
public class CourseController {

    @Autowired
    private CourseService courseService;

    @PostMapping()
    public String save(Course course) {
        System.out.println(course.toString());
        courseService.save(course);
        return "redirect:/";
    }

    @PutMapping
    public boolean update(@RequestBody Course course) {
        return courseService.update(course);
    }

    @DeleteMapping("/{id}")
    public boolean delete(@PathVariable Integer id) {
        return courseService.delete(id);
    }

    @GetMapping("/{id}")
    public Course getById(@PathVariable Integer id) {
        return courseService.getById(id);
    }

    @GetMapping
    public String  getAll(Model model) {
        List<Course> courseList = courseService.getAll();
        model.addAttribute("courseList", courseList);
        return "index.jsp";
    }
}
