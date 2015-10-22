<%-- 
    Document   : UsersPics
    Created on : Sep 24, 2014, 2:52:48 PM
    Author     : Administrator
--%>

<%@page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Instagrim</title>
        <link rel="stylesheet" type="text/css" href="/Instagrim/Bootstrap/bootstrap.css" />
        <link href='https://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'/>
        <link rel="stylesheet" type="text/css" href="/Instagrim/style.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%ProfileAvatarBean pab = (ProfileAvatarBean) session.getAttribute("ProfileAvatarBean");%>
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
                <% LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                   session.setAttribute("UserName", lg.getUsername());
                   session.setAttribute("fName", lg.getFName());%>
            <h1>${UserName}</h1>
            <h2>${fName}</h2>
            </div>
        <%
//            java.util.LinkedList<Pic> lsPics = (java.util.LinkedList<Pic>) request.getAttribute("Pics");
//            if (lsPics == null) {
        %>
        <!--<p>No Pictures found</p>-->
        <%
//        } else {
//            Iterator<Pic> iterator;
//            iterator = lsPics.iterator();
//            while (iterator.hasNext()) {
//                Pic p = (Pic) iterator.next();

//        %>
        <a href="/Instagrim/Image/<%=pab.getAvatar().getSUUID()%>"><img id="avatarImg" class="img-circle" src="/Instagrim/Thumb/<%=pab.getAvatar().getSUUID()%> "></a>
        <!--<a href="/Instagrim/Image/<%= //p.getSUUID()%>" ><img src="/Instagrim/Thumb/<%= //p.getSUUID()%>"></a><br/>-->
        <%

            }
            }
        %>
        </article>
<!--         <div class="container">
            <form id="uploadForm" method="POST" enctype="multipart/form-data" action="Image">
                File to upload: <input type="file" name="upfile"><br/>

                <br/>
                <a href=""<button id="uploadBtn" type="submit" class="btn btn-default">Upload</button>
                <input type="submit" value="Press"> to upload the file!
            
            </form>
         </div>-->
        <div class="container">
            <form id="uploadForm" method="POST" enctype="multipart/form-data" action="Image">
                Image picture to upload: <input type="file" name="upfile"><br/>
    
                <br/>
                <!--<a href=""<button id="uploadBtn" type="submit" class="btn btn-default">Upload</button>-->
                <input type="submit" value="Press"> to upload the file!
            </form>
        </div>
       
    </body>
</html>
