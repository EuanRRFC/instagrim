<%-- 
    Document   : register.jsp
    Created on : Sep 28, 2014, 6:29:51 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Instagrim</title>
        <link rel="stylesheet" type="text/css" href="bootstrap.css" />
        <link href='https://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'/>
        <link rel="stylesheet" type="text/css" href="Styles.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    
    <body>
        <nav id="navbar" class="navbar navbar-default navbar-static-top">
                <div class="container">
                     <ul id="tabs" class="nav nav-tabs">
                         <li role="presentation" class="active"><a href="/Instagrim">Home</a></li>
                         <li role="presentation"><a href="upload.jsp">Upload</a></li>
                         <li><a href="register.jsp">Register</a></li>
                         <li><a href="login.jsp">Login</a></li>
                     </ul>
                </div>
        </nav>
       
        <article>
            <div id="registerForm" class="container">
                <h3>Register as user</h3>
                <form method="POST"  action="Register">
                    <ul>
                        <li>User Name <input type="text" name="username"></li>
                        <li>Password <input type="password" name="password"></li>
                    </ul>
                    <br/>
                    <button <input type="submit" id="signup" type="button" class="btn btn-default">Sign Up</button>
                </form>
            </div>
        </article>
    </body>
</html>
