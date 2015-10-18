<%-- 
    Document   : index
    Created on : Sep 28, 2014, 7:01:44 PM
    Author     : Administrator
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Instagrim</title>
        <link rel="stylesheet" type="text/css" href="style.css" />
        <link rel="stylesheet" type="text/css" href="/Instagrim/Bootstrap/bootstrap.css" />
        <link href='https://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'/>
        
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    
    <body>
        <nav id="navbar" class="navbar navbar-default navbar-static-top">
                <div class="container">
                     <ul id="tabs" class="nav nav-tabs">
                         <!--Checks if user is logged in or not-->
                         <%
                        
                        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                        if (lg != null) {
                            String UserName = lg.getUsername();
                            if (lg.getlogedin()) {
                    %>
                <!--If logged in then display these tabs instead-->
                <li role="presentation"><a href="/Instagrim/Images/<%=lg.getUsername()%>">Profile</a></li>
                <li role="presentation"><a href="upload.jsp">Upload</a></li>
                <li id="logBtn" role="presentation"><a href="/Instagrim/Logout">Logout</a></li>
                    <%}
                        }else{%>
                 <li role="presentation" class="active"><a href="/Instagrim">Home</a></li>
                 <li><a href="register.jsp">Register</a></li>
                 <li id="logBtn"><a href="login.jsp">Login</a></li>
                <%}%>
            </ul>
                </div>
        </nav>
            <div id="jam" class="jumbotron">
                <div class="container">
                    <h1>InstaGrim</h1>
                    <h2>Cats, food and memes in black & white</h2>
                    <a href="register.jsp"><button id="signup" type="button" class="btn btn-default">Sign Up</button></a>
                    </div>
            </div>
    </body>
</html>
