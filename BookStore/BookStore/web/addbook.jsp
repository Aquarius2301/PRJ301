<%-- 
    Document   : addbook
    Created on : Jun 27, 2023, 10:32:24 PM
    Author     : Aquarius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                width: 100%;
            }

            .warning {
                margin: 5px 0;
                color:red;
            }
        </style>
        <script>


            function validateForm() {
                var id = document.getElementById('id').value;
                var name = document.getElementById('name').value;
                var description = document.getElementById('description').value;
                var price = document.getElementById('price').value;
                var author = document.getElementById('author').value;

                var idWarning = document.getElementById('idWarning');
                var nameWarning = document.getElementById('nameWarning');
                var descriptionWarning = document.getElementById('descriptionWarning');
                var priceWarning = document.getElementById('priceWarning');
                var authorWarning = document.getElementById('authorWarning');

                var isValidate = true;

                idWarning.innerHTML = "";
                nameWarning.innerHTML = "";
                descriptionWarning.innerHTML = "";
                priceWarning.innerHTML = "";
                authorWarning.innerHTML = "";


                if (id === "") {
                    idWarning.innerHTML = "ID can't be empty!";
                    isValidate = false;
                }
                if (name === "") {
                    nameWarning.innerHTML = "Name can't be empty!";
                    isValidate = false;
                }
                if (description === "") {
                    descriptionWarning.innerHTML = "Description can't be empty!";
                    isValidate = false;
                }
                if (price === "") {
                    priceWarning.innerHTML = "Price can't be empty!";
                    isValidate = false;
                } else if (isNaN(parseInt(price)) || parseInt(price) < 0) {
                    priceWarning.innerHTML = "Price must be a number greater than or equals to 0";
                    isValidate = false;
                }
                if (author === "") {
                    authorWarning.innerHTML = "Author can't be empty!";
                    isValidate = false;
                }
                return isValidate;
            }

        </script>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <div class="login-container">
                <h2>Add Book</h2>
                <form action="addbook" method="post" onsubmit="return validateForm()">
                    <div class="form-group">
                        <label for="id">Book ID</label>
                        <input type="text" class="form-control" id="id" 
                               placeholder="Enter the ID" name="id" 
                               value="<%=request.getParameter("id")==null?"":request.getParameter("id")%>">
                        <p id="idWarning" class="warning"></p>
                    </div>
                    <div class="form-group">
                        <label for="name">Name</label>
                        <input type="text" class="form-control" id="name" placeholder="Enter the name" name="name"  value="<%=request.getParameter("name")==null?"":request.getParameter("name")%>">
                        <p id="nameWarning" class="warning"></p>
                    </div>
                    <div class="form-group">
                        <label for="description">Description</label>
                        <input type="text" class="form-control" id="description" placeholder="Enter the description" name="description"  value="<%=request.getParameter("description")==null?"":request.getParameter("description")%>">
                        <p id="descriptionWarning" class="warning"></p>
                    </div>
                    <div class="form-group">
                        <label for="price">Price</label>
                        <input type="text" class="form-control" id="price" placeholder="Enter the price" name="price"  value="<%=request.getParameter("price")==null?"":request.getParameter("price")%>">
                        <p id="priceWarning" class="warning"></p>
                    </div>
                    <div class="form-group">
                        <label for="author">Author</label>
                        <input type="text" class="form-control" id="author" placeholder="Enter the author" name="author"  value="<%=request.getParameter("author")==null?"":request.getParameter("author")%>">
                        <p id="authorWarning" class="warning"></p>
                    </div>
                    <button class= "btn btn-primary" type="submit">Add</button>
                    <p name="warning" class="warning">${warning}</p>
                </form>
            </div>
        </div>
    </body>
    <script src="js/addbook.js" type="text/javascript"></script>
</html>
