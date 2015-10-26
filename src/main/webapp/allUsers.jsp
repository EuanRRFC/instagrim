<%-- 
    Document   : allUsers
    Created on : 25-Oct-2015, 19:02:06
    Author     : Euan
--%>

<%@page import="uk.ac.dundee.computing.aec.instagrim.stores.ProfileAvatarBean"%>
<%@page import="uk.ac.dundee.computing.aec.instagrim.stores.LoggedIn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Instagrim</title>
        <link rel="stylesheet" type="text/css" href="/Instagrim/Bootstrap/bootstrap.css" />
        <link href='https://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'/>
        <link rel="stylesheet" type="text/css" href="/Instagrim/style.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <% LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
        ProfileAvatarBean pab = (ProfileAvatarBean) session.getAttribute("ProfileAvatarBean");
        session.setAttribute("username", lg.getUsername());%>
    </head>
   <body>
        <nav id="navbar" class="navbar navbar-default navbar-static-top">
                <div class="container">
                     <ul id="tabs" class="nav nav-tabs">
                         <li><a href="/Instagrim">Home</a></li>
                         <li><a href="/Instagrim/upload.jsp">Upload</a></li>
                         <li id="logBtn" role="presentation"><a href="/Instagrim/Logout">
                                 <span class="glyphicon glyphicon-logy" aria-hidden="true"></span>Logout</a></li>
                    </ul>
                </div>
            <p>${username}</p>
            
       </nav>
    </body>
</html>
