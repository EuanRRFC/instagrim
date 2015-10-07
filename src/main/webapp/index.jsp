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
        <link rel="stylesheet" type="text/css" href="bootstrap.css" />
        <link rel="stylesheet" type="text/css" href="Styles.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    
    <body>
        <nav id="navbar" class="navbar navbar-default navbar-static-top">
                <div class="container">
                     <ul id="tabs" class="nav nav-tabs">
                      <li role="presentation" class="active"><a href="/Instagrim">Home</a></li>
                       <li role="presentation"><a href="upload.jsp">Upload</a></li>
                         <%
                        
                        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                        if (lg != null) {
                            String UserName = lg.getUsername();
                            if (lg.getlogedin()) {
                    %>

                <li role="presentation"><a href="/Instagrim/Images/<%=lg.getUsername()%>">Your Images</a></li>
                <li role="presentation"><a href="/Instagrim/Logout">Logout</a></li>
                    <%}
                            }else{
                                %>
                 <li><a href="register.jsp">Register</a></li>
                <li><a href="login.jsp">Login</a></li>
                
                <%
                                        
                            
                    }%>
            </ul>
                </div>
        </nav>
            <div id="jam" class="jumbotron">
                <div class="container">
                    <h1>InstaGrim ! </h1>
                    <h2>Your world in Black and White</h2>
                </div>
            </div>
    </body>
</html>
