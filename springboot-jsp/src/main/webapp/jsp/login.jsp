<!DOCTYPE html>
<html>

<body>
<h1>Login Page</h1>

<%--<form action="/user/login" method="post">--%>
<%--    <label for="username">Username:</label>--%>
<%--    <input time="text" id="username" name="username" required><br><br>--%>

<%--    <label for="password">Password:</label>--%>
<%--    <input time="password" id="password" name="password" required><br><br>--%>

<%--    <input type="submit" value="Login">--%>
<%--</form>--%>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        display: flex;
        align-items: center;
        justify-content: center;
        height: 100vh;
    }

    #loginForm {
        background-color: #ffffff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        width: 300px;
    }

    label {
        display: block;
        margin-bottom: 8px;
        color: #333;
    }

    input {
        width: 100%;
        padding: 8px;
        margin-bottom: 16px;
        box-sizing: border-box;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    input[type="submit"] {
        background-color: #4caf50;
        color: #fff;
        cursor: pointer;
    }

    input[type="submit"]:hover {
        background-color: #45a049;
    }
</style>

<form id="loginForm">
    <label for="username">Username:</label>
    <input type="text" id="username" name="username" required><br><br>

    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required><br><br>

    <input type="button" value="Login" onclick="submitForm()">
</form>

<script>
    function submitForm() {
        var username = document.getElementById("username").value;
        var password = document.getElementById("password").value;

        var data = {
            username: username,
            password: password
        };

        fetch('/user/login', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(data)
        })
            .then(response => response.json())
            .then(data => {
                console.log(data)
                if (data.data == 'succeed') {
                    // Redirect to /jsp/index.jsp if the result is 'succeed'
                    window.location.href = '/jsp/index.jsp';
                } else {
                    // Show an alert with the data received from the server
                    alert(data.data || 'Login failed');
                }
            })
            .catch(error => {
                console.error('Error:', error);
            });
    }
</script>

</body>
</html>
