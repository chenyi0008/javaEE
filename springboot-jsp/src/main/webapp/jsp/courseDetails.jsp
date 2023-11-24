<%@ page import="com.example.springbootjsp.domain.Course" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="com.example.springbootjsp.config.ApplicationContextProvider" %>
<%@ page import="com.example.springbootjsp.dao.CourseDao" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: 71563
  Date: 2023/11/24
  Time: 16:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    ApplicationContext context = ApplicationContextProvider.getContext();
    // Get the CourseMapper bean
    CourseDao courseDao = (CourseDao) context.getBean(CourseDao.class);
    // Call the mapper method to get the course list
    List<Course> courseList = courseDao.getAll();
    System.out.println(courseList.toString());

    String courseId = request.getParameter("id");


%>

<html>
<body>

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
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <%
//        for (int i = 0; i < courseList.size(); i++) {
            Course course = courseList.get(Integer.parseInt(courseId));
    %>
    <tr align="center">
        <td><%=course.getId()%></td>
        <td><a href="courseDetails.jsp?id=<%=course.getId()%>"><%=course.getName()%></a></td>
        <td><%=course.getTime()%></td>
        <td><%=course.getDescription()%></td>
        <td><%=course.getClassroom()%></td>
        <td><%=course.getCapacity()%></td>
        <td><%=course.getTeachingMethod()%></td>
        <td><button onclick="location.href='index.jsp'">返回</button></td>
    </tr>
    <%
//        }
    %>
    </tbody>
</table>
</body>
</html>
