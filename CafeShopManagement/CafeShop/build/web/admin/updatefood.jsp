<%-- 
    Document   : updateFood
    Created on : Jul 12, 2023, 4:20:41 PM
    Author     : Aquarius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="stylesheet" href="../css/myStyle.css">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <head>
        <title>Welcome to Our Cafe</title>
        <style>


            .form-group {
                margin-bottom: 20px;

            }

            .form-group label {
                display: block;
                font-weight: bold;
                margin-bottom: 5px;
                color: #814c27;
            }

            .form-group input {
                width: 100%;
                padding: 10px;
                border-radius: 5px;
                border: 1px solid #ccc;
                font-size: 16px;
                transition: border-color 0.3s;
            }

            .form-group input:focus {
                border-color: #814c27;
            }

            .submit-btn {
                width: 100%;
                padding: 12px;
                background-color: #814c27;
                color: white;
                font-size: 16px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            .submit-btn:hover {
                background-color: #66381a;
            }


            input.button{
                display: inline-block;
                padding: 12px 30px;
                margin: 20px 0;
                background-color: #ebaa71;
                color: #fff;
                border: none;
                text-decoration: none;
                border-radius: 5px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
                transition: background-color 0.3s;
                width:95%

            }


            input.button:hover {
                background-color: #e49958;
                color: #ff3300;
                text-decoration: none;
            }

            button{
                display: inline-block;
                padding: 2px 9px;
                margin: 20px 0;
                background-color: #ebaa71;
                color: #fff;
                border: none;
                text-decoration: none;
                border-radius: 5px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
                transition: background-color 0.3s;

            }


            button:hover {
                background-color: #e49958;
                color: #ff3300;
                text-decoration: none;
            }
            select{
                width: 100%;
                padding: 10px;
                border-radius: 5px;
                border: 1px solid #ccc;
                font-size: 16px;
                transition: border-color 0.3s;
            }
            .container{
                width: 50%;
            }


        </style>



    </head>
    <body>
        <nav>
            <ul class="navigation-menu">

                <li ><a href="./home">Home</a></li>
                <li class="active" ><a href="./foodList">View Food</a></li>
                <li><img src="../img/logo.png"></li>
                <li><a href="./showFeedback">Show Feedback</a></li>
                <!--                <li class="dropdown">
                                    <a href="#">Setting</a>
                                    <ul>
                                        <li><a href="./update">Change Information</a></li>
                                        <li><a href="#">Change Password</a></li>
                                    </ul>
                                </li>-->

                <li><a href="./logout">Logout</a></li>

            </ul>
        </nav>
        <div class="container">

            <form onsubmit="return validateForm()" class="login-form"action="updateFood" method="post" >
                <input name="id" type="hidden" readonly value="${id}">
                <div class="form-group">
                    <label>Name</label> <input id="name" type="text" name="name" value="${name}"> </div>
                <div class="form-group">
                    <label>Price</label> <input id="price" type="number" name="price" step="any" value="${price}"> </div>
                <div class="form-group"> <label>Sale Percent</label> <input id="sale" 
                                                                            type="number" step="any" name="sale" value="${sale}"> </div>
                <div class="form-group"> <label>Category</label> <select name ="category"value="${category}>">
                        <option>Food</option><option>Dessert</option><option>Beverage</option>
                    </select> </div>

                <div class="form-group">
                    <label> Description</label> <input type="text" name="description" value="${description}"> </div>
                <input type="submit" value="Submit" class="submit-btn">
                <p id="error-message"></p>
            </form>
        </div>

        <script>

            function validateForm() {
                var name = document.getElementById("name").value;
                var price = document.getElementById("price").value;
                var sale = document.getElementById("sale").value;

                var errorMessage = document.getElementById("error-message");

                if (name === "" || price === "" || sale === "") {
                    errorMessage.innerText = "Please enter all input.";
                    return false;
                }

                if (price <= 0) {
                    errorMessage.innerText = "The price must be greater than 0.";
                    return false;
                }
                if (sale < 0) {
                    errorMessage.innerText = "The sale price must be greater than or equals to 0.";
                    return false;
                }

                return true;
            }
        </script>
    </body>
</html>
