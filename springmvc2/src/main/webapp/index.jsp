<%@ page import="com.chen.domain.Course" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.springframework.context.support.ClassPathXmlApplicationContext" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="com.chen.dao.CourseDao" %>
<%@ page import="org.springframework.web.context.support.AnnotationConfigWebApplicationContext" %>
<%@ page import="com.chen.config.SpringConfig" %>
<%@ page import="com.chen.config.ApplicationContextProvider" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<%
    ApplicationContext context = ApplicationContextProvider.getContext();
    // Get the CourseMapper bean
    CourseDao courseDao = (CourseDao) context.getBean(CourseDao.class);
    // Call the mapper method to get the course list
    List<Course> courseList = courseDao.getAll();
%>

<%
    // Handle the form submission
    if (request.getMethod().equalsIgnoreCase("post")) {
        String time = request.getParameter("time");
        String name = request.getParameter("name");
        String description = request.getParameter("description");

        // Validate the inputs (you may need more robust validation)
        if (time != null && name != null && description != null) {
            Course newCourse = new Course();
            newCourse.setTime(time);
            newCourse.setName(name);
            newCourse.setDescription(description);

            // Save the new course to the database using CourseDao
            courseDao.save(newCourse);
            System.out.println(newCourse.toString());

            // Redirect to the course list page or show a success message
//            response.sendRedirect("/");
            return;
        } else {
            // Handle validation errors, if any
            // You can set attributes to show error messages on the form
            // For simplicity, let's just print an error message here
            System.out.println("Invalid input. Please fill in all fields.");
        }
    }
%>


<html>
<body>
<h2>Hello World!</h2>

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

<body>
<h2>Add New Course</h2>
<form method="post" action="/course" enctype="application/x-www-form-urlencoded">
    Time: <input type="text" name="time" placeholder="yyyy-MM-dd HH:mm:ss" required><br>
    Name: <input type="text" name="name" required><br>
    Description: <textarea name="description" rows="4" required></textarea><br>
    <input type="submit" value="Add Course">
</form>
</body>


</html>

