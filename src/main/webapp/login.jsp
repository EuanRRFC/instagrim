<%-- 
    Document   : login.jsp
    Created on : Sep 28, 2014, 12:04:14 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
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
                         <li><a href="/Instagrim/Images/majed">Sample Images</a></li>
                         <li><a href="register.jsp">Register</a></li>
                     </ul>
                </div>
        </nav>
       
       
            <div id="loginPage" class="jumbotron">
                <div class="container">
                    <h1>Login</h1>
                    <form method="POST"  action="Login">
                        <ul>
                            <li style="list-style-type: none;">User Name</li>
                            <li style="list-style-type: none;"><input type="text" name="username"></li>
                            <li style="list-style-type: none;">Password</li>
                            <li style="list-style-type: none;"><input type="password" name="password"></li>
                            <button <input type="submit" id="logInBtn" type="button" class="btn btn-default">Log In</button>
<!--                        <input type="submit" value="Login"> -->
                         </ul>
                        <br/>
                    </form>
                </div>
            </div>
        
    </body>
</html>
