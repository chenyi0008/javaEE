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
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 20px;
        padding: 20px;
        background-color: #f4f4f4;
    }

    h2 {
        color: #333;
    }

    button {
        padding: 10px;
        margin: 5px;
        font-size: 14px;
        cursor: pointer;
        background-color: #4caf50;
        color: #fff;
        border: none;
        border-radius: 4px;
    }

    button:hover {
        background-color: #45a049;
    }

    table {
        width: 80%;
        margin: 20px auto;
        border-collapse: collapse;
    }

    th, td {
        padding: 12px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    th {
        background-color: #4caf50;
        color: white;
    }

    tr:hover {
        background-color: #f5f5f5;
    }
</style>


<%
    ApplicationContext context = ApplicationContextProvider.getContext();
    // Get the CourseMapper bean
    CourseDao courseDao = (CourseDao) context.getBean(CourseDao.class);
    // Call the mapper method to get the course list
    List<Course> courseList = courseDao.getAll();
    System.out.println(courseList.toString());
%>




<html>
<body>
<h2>查询</h2>
<button onclick="location.href='add.jsp'">添加</button>
<button onclick="location.href='update.jsp'">修改</button>
<table border="1" align="center">
    <thead>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Time</th>
        <th>Description</th>
        <th>ClassRoom</th>
        <th>Capacity</th>
        <th>TeachingMethod</th>

    </tr>
    </thead>
    <tbody>

    <%
        for (int i = 0; i < courseList.size(); i++) {
            Course course= courseList.get(i);
    %>

    <tr align="center">
        <td><%=course.getId()%></td>
        <td><a href="courseDetails.jsp?id=<%=course.getId()%>"><%=course.getName()%></a></td>
        <td><%=course.getTime()%></td>
        <td><%=course.getDescription()%></td>
        <td><%=course.getClassroom()%></td>
        <td><%=course.getCapacity()%></td>
        <td><%=course.getTeachingMethod()%></td>
    </tr>


    <%
        }
    %>


    </tbody>
</table>
</body>


</html>

