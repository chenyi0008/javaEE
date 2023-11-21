<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.springframework.context.support.ClassPathXmlApplicationContext" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="org.springframework.web.context.support.AnnotationConfigWebApplicationContext" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.example.springbootjsp.config.ApplicationContextProvider" %>
<%@ page import="com.example.springbootjsp.dao.CourseDao" %>
<%@ page import="com.example.springbootjsp.domain.Course" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    ApplicationContext context = ApplicationContextProvider.getContext();
    // Get the CourseDao bean
    CourseDao courseDao = (CourseDao) context.getBean(CourseDao.class);
    // Call the dao method to get the course list
    List<Course> courseList = courseDao.getAll();
%>

<html>
<body>
<h2>修改课程</h2>
<form action="/course/update" method="post" enctype="application/x-www-form-urlencoded">
    <label for="course">选择课程:</label>
    <select id="course" name="course" onchange="showCourseDetails()">
        <% for (Course course : courseList) { %>
            <option value="<%= course.getId() %>"><%= course.getName() %></option>
        <% } %>
    </select>
    <br>
    <label for="name">课程名称:</label>
    <input type="text" id="name" name="name">
    <br>
    <label for="description">课程描述:</label>
    <textarea id="description" name="description"></textarea>
    <br>
    <label for="time">课程时间:</label>
    <input type="text" id="time" name="time">
    <br>
    <input type="submit" value="保存">
</form>

<script>
    function showCourseDetails() {
        var courseId = document.getElementById("course").value;
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                var course = JSON.parse(xhr.responseText);
                document.getElementById("name").value = course.name;
                document.getElementById("name").value = course.name;
                document.getElementById("description").value = course.description;
                document.getElementById("time").value = course.time;
            }
        };
        xhr.open("GET", "/course/" + courseId, true);
        xhr.send();
    }
</script>
</body>
</html>