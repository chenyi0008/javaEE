package com.example.springbootjsp.domain;

import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class Course {


    @NotNull(message = "ID不能为null")
    private Integer id;

    @NotBlank(message = "Time不能为空")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Pattern(
            regexp = "^\\d{4}-\\d{2}-\\d{2} \\d{2}:\\d{2}:\\d{2}$",
            message = "格式错误 请遵循： yyyy-MM-dd HH:mm:ss"
    )
    private String time;

    @NotBlank(message = "Name不能为空")
    @Size(min = 3, max = 50, message = "Name必须在3-50个字符之间")
    private String name;

    @NotBlank(message = "Description不能为空")
    @Size(max = 255, message = "Description不能超过255个字符")
    private String description;
    @Override
    public String toString() {
        return "Course{" +
                "id=" + id +
                ", time='" + time + '\'' +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
