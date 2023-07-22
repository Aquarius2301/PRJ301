<%-- 
    Document   : index.jsp
    Created on : Jun 27, 2023, 8:53:34 PM
    Author     : Aquarius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title> 
        <link href="bootstrap.css" rel="stylesheet" type="text/css"/>
        <style>
            body {
                background-color: #f8f9fa;
            }

            .login-container {
                max-width: 400px;
                margin: 0 auto;
                margin-top: 100px;
                background-color: #fff;
                border-radius: 5px;
                padding: 20px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            }

            .login-container h2 {
                text-align: center;
                margin-bottom: 20px;
            }

            .form-group {
                margin-bottom: 20px;
            }

            .form-group label {
                font-weight: bold;
            }

            .form-control {
                height: 40px;
            }

            .btn-primary {
                width: 49%;
            }

            .warning {
                margin: 5px 0;
                color:red;
            }
        </style>

        <script>

            function validateForm() {
                var username = document.getElementById('username').value;
                var password = document.getElementById('password').value;

                var usernameWarning = document.getElementById('usernameWarning');
                var passwordWarning = document.getElementById('passwordWarning');
                var isValidate = true;
                usernameWarning.innerHTML = "";
                passwordWarning.innerHTML = "";

                if (username === "") {
                    usernameWarning.innerHTML = "Username can't be empty!";
                    isValidate = false;
                }
                if (password === "") {
                    passwordWarning.innerHTML = "Password can't be empty!";
                    isValidate = false;
                }
                return isValidate;
            }

            function clearForm() {
                document.getElementById('username').value = "";
                document.getElementById('password').value = "";
            }

        </script>
    </head>
    <body>
        <div class="container">
            <div class="login-container">
                <h2>Login</h2>
                <form action="login" method="post" onsubmit="return validateForm()">
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" class="form-control" id="username" 
                               placeholder="Enter your username" name="username" 
                               value="<%=request.getParameter("username")==null?"":request.getParameter("username")%>">
                        <p id="usernameWarning" class="warning"></p>
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>

                        <input type="password" class="form-control" id="password" placeholder="Enter your password" name="password"  >
                        <p id="passwordWarning" class="warning"></p>
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                    <button type="button" class="btn btn-primary" onclick="clearForm()">Clear</button>
                    <p class="warning">${warning}</p>
                </form>
            </div>
        </div>
    </body>
</html>
