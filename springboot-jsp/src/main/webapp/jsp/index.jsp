<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.springframework.context.support.ClassPathXmlApplicationContext" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="org.springframework.web.context.support.AnnotationConfigWebApplicationContext" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.example.springbootjsp.dao.CourseDao" %>
<%@ page import="com.example.springbootjsp.config.ApplicationContextProvider" %>
<%@ page import="com.example.springbootjsp.domain.Course" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<%
    ApplicationContext context = ApplicationContextProvider.getContext();
    // Get the CourseMapper bean
    CourseDao courseDao = (CourseDao) context.getBean(CourseDao.class);
    // Call the mapper method to get the course list
    List<Course> courseList = courseDao.getAll();
%>




<html>
<body>
<h2>查询</h2>
<button onclick="location.href='jsp/add.jsp'">添加</button>
<button onclick="location.href='jsp/update.jsp'">修改</button>
<table border="1" align="center">
    <thead>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Time</th>
        <th>Description</th>
    </tr>
    </thead>
    <tbody>

    <%
        for (int i = 0; i < courseList.size(); i++) {
            Course course= courseList.get(i);
    %>

    <tr align="center">
        <td><%=course.getId()%></td>
        <td><%=course.getName()%></td>
        <td><%=course.getTime()%></td>
        <td><%=course.getDescription()%></td>
    </tr>

    <%
        }
    %>


    </tbody>
</table>
</body>


</html>

