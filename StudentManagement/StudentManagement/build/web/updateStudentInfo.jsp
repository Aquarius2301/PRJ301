<%-- 
    Document   : updateStudentInfo
    Created on : Jun 1, 2023, 6:25:16 PM
    Author     : khang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Student</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <link rel="stylesheet" href="index.css"/>
    </head>
    <body>
        <%     
           String gender = (String) session.getAttribute("gender");
        %>
        <div class="container">
            <form action="update" method = "post">
                <label>ID:</label>
                <input type="text" readonly name="id" value="${id}">
                <label>Name:</label>
                <input type="text" name="name" value="${name}">
                <p id="warning">${nameWarning}</p>
                <label>Birthday:</label>
                <input type="date" name="birthday" value="${birthday}">

                <label>Gender:</label> 
                <select name="gender" >
                    <option value="Male" <%=gender.equals("Male")?"selected":""%> >Male</option>
                    <option value="Female" <%=gender.equals("Female")?"selected":""%> >Female</option>
                </select>

                <label>Email:</label>
                <input type="text" name="email" value="${email}">
                <p id="warning">${emailWarning}</p>
                <label>Phone:</label>
                <input type="text" name="phone" value="${phone}">
                <p id="warning">${phoneWarning}</p>
                <label>Address:</label>
                <input type="text" name="address" value="${address}">
                <p id="warning">${addressWarning}</p>
                <button style="width: 100%"  type="submit">Save</button>
            </form>
        </div>
    </body>
</html>
