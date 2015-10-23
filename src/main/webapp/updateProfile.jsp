<%-- 
    Document   : updateProfile
    Created on : 23-Oct-2015, 13:49:24
    Author     : Euan
--%>

<%@page import="uk.ac.dundee.computing.aec.instagrim.stores.LoggedIn"%>
<%@page import="uk.ac.dundee.computing.aec.instagrim.stores.ProfileAvatarBean"%>
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
                         <!--<li role="presentation"><a href="/Instagrim/Images/<%=lg.getUsername()%>">Your Images</a></li>-->
                         <li id="logBtn" role="presentation"><a href="/Instagrim/Logout">
                                 <span class="glyphicon glyphicon-logy" aria-hidden="true"></span>Logout</a></li>
                    </ul>
                </div>
       </nav>
    </body>
    <article>
        <div id="profileInfo" class="container">
            <h1>${username}</h1>
              <li id="registerTabs" style="list-style: none">User Name <input id="registerTabs2" type="text" name="username"></li>
              <li id="registerTabs" style="list-style: none">Password <input id="registerTabs2" type="password" name="password"></li>
              <li id="registerTabs" style="list-style: none">Re-enter Password <input id="registerTabs2" type="password" name="password2"></li>
              <li id="registerTabs" style="list-style: none">Email <input id="registerTabs2" type="email" name="email"></li>
              <li id="registerTabs" style="list-style: none">First Name <input id="registerTabs2" type="fName" name="fName"></li>
              <li id="registerTabs" style="list-style: none">Last Name <input id="registerTabs2" type="sName" name="sName"></li>
        </div>
    </article>
</html>
