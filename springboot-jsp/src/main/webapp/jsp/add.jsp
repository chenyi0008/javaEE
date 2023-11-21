  Created by IntelliJ IDEA.
  User: 71563
  Date: 2023/11/14
  Time: 16:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>



<html>
<head>
    <title>Title</title>
</head>
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
