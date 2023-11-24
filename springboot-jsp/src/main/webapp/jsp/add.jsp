
<%@ page contentType="text/html;charset=UTF-8" language="java" %>



<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Add New Course</h2>
<%--<form method="post" action="/course" enctype="application/x-www-form-urlencoded">--%>
<%--    Time: <input type="text" name="time" placeholder="yyyy-MM-dd" required><br>--%>
<%--    Name: <input type="text" name="name" required><br>--%>
<%--    Description: <textarea name="description" rows="4" required></textarea><br>--%>
<%--    <input type="submit" value="Add Course">--%>
<%--</form>--%>

<h2>Add New Course</h2>
<form method="post" action="/course" enctype="application/x-www-form-urlencoded">
    ID: <input type="number" name="id" required><br>
    Time: <input type="text" name="time" placeholder="yyyy-MM-dd" required><br>
    Name: <input type="text" name="name" required><br>
    Description: <textarea name="description" rows="4" required></textarea><br>
    Classroom: <input type="text" name="classroom" required><br>
    Capacity: <input type="number" name="capacity" required><br>
    Teaching Method: <select name="teachingMethod" required>
    <option value="线下">线下</option>
    <option value="线上">线上</option>
</select><br>
    <input type="submit" value="Add Course">
</form>


</body>
</html>
