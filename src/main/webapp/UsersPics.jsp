<%-- 
    Document   : UsersPics
    Created on : Sep 24, 2014, 2:52:48 PM
    Author     : Euan - Updated
--%>

<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="/Instagrim/Bootstrap/bootstrap.css" />
        <link href='https://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'/>
        <link rel="stylesheet" type="text/css" href="/Instagrim/styles.css" />
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
                         <li><a href="/Instagrim/updateProfile.jsp">Update Profile</a></li>
                         <li id="logBtn" role="presentation"><a href="/Instagrim/Logout">
                                 <span class="glyphicon glyphicon-logy" aria-hidden="true"></span>Logout</a></li>   
                                 
                    </ul>
                </div>
       </nav>
 
        <article>
            <p>Profile Picture</p>
            <a href="/Instagrim/Image/<%=pab.getAvatar().getSUUID()%>" ><img src="/Instagrim/Thumb/<%=pab.getAvatar().getSUUID()%>"></a><br/>
                <p>Name: <%=pab.getFName()%> <%=pab.getSName()%></p>
                <p>Email: <%=pab.getEmail()%></p>
            <h1>Your Pics</h1>
        <%
            java.util.LinkedList<Pic> lsPics = (java.util.LinkedList<Pic>) request.getAttribute("Pics");
            if (lsPics == null) {
        %>
        <p>No Pictures found</p>
        <%
        } else {
            Iterator<Pic> iterator;
            iterator = lsPics.iterator();
            while (iterator.hasNext()) {
                Pic p = (Pic) iterator.next();

        %>
        
        <a href="/Instagrim/Image/<%=p.getSUUID()%>" ><img src="/Instagrim/Thumb/<%=p.getSUUID()%>"></a><br/><%

            }
            }
        %>
        </article>
        <footer>
            <ul>
                <li class="footer"><a href="/Instagrim">Home</a></li>
            </ul>
        </footer>
    </body>
</html>
