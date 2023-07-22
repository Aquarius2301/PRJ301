<%-- 
    Document   : index
    Created on : Jun 1, 2023, 1:51:13 PM
    Author     : khang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Login Page</title>
        <link rel="stylesheet" href="index.css"/>

    </head>
    <body>
        <div class="container">
            <h2>Login</h2>
            <form action="login" method="post">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" VALUE="${username}">
                <p id="warning">${usernameWarning}</p>
                <label for="password">Password:</label>
                <input type="password" id="password" name="password">
                <p id="warning">${passwordWarning}</p>
                <button type="submit" name="choose" value="Login">Login</button> 
                <button type="submit" name="choose" value="Cancel">Cancel</button>
                <p style="margin-top: 10px" id="warning">${warning}</p>
            </form>
        </div>

    </body>
</html>
