<%-- 
    Document   : profile
    Created on : 21-Oct-2015, 12:12:09
    Author     : Euan
--%>

<%@page import="java.util.Iterator"%>
<%@page import="uk.ac.dundee.computing.aec.instagrim.stores.Pic"%>
<%@page import="uk.ac.dundee.computing.aec.instagrim.stores.LoggedIn"%>
<%@page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<%@page import="java.util.*" %>
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
        session.setAttribute("username", lg.getUsername());
        session.setAttribute("fName", lg.getFName());
//        ProfileAvatarBean pab = (ProfileAvatarBean) session.getAttribute("ProfileAvatarBean");%>
    </head>
    <body>
         <nav id="navbar" class="navbar navbar-default navbar-static-top">
                <div class="container">
                     <ul id="tabs" class="nav nav-tabs">
                         <li><a href="/Instagrim">Home</a></li>
                         <li><a href="/Instagrim/upload.jsp">Upload</a></li>
                         <li id="logBtn" role="presentation"><a href="/Instagrim/Logout">
                                 <span class="glyphicon glyphicon-logy" aria-hidden="true"></span>Logout</a></li>
<!--                         <button <input type="submit" id="logBtn" type="button">
                             <span class="glyphicon glyphicon-log-out" aria-hidden="true"</span>Logout</button>-->
                    </ul>
                </div>
       </nav>
        
         <article>
            <div id="profileInfo" class="container">
            <h1>${username}</h1>
            <h2>${fName}</h2>
            </div>
            <img src="Instagrim/thumb/"$(ProfileAvatarBean.getAvatar());>
            <article>
            <div id="profileInfo" class="container">
                <h3>Your pics</h3>
                <%
                    java.util.LinkedList<Pic> lsPics = (java.util.LinkedList<Pic>) request.getAttribute("Pics");
                    if (lsPics == null) {
                %>
                <p>No Pictures found here</p>
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
            </div>
        </article>
         <form id="profieUpload" method="POST" enctype="multipart/form-data" action="ProfileImage">
            <ul>
                <li id="registerTabs" style="list-style: none">Profile Picture <input id="registerTabs2" type="file" name="upfile"></li>
                <li id="registerTabs">Upload picture <input id="registerTabs2" type="submit" value="Press"></li>
            </ul>
            
        </form>
    </body>
</html>
