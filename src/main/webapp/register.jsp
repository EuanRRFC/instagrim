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
        <link rel="stylesheet" type="text/css" href="/Instagrim/Bootstrap/bootstrap.css" />
        <link href='https://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'/>
        <link rel="stylesheet" type="text/css" href="style.css" />
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
                    <%
//                        boolean userExist = false;
//                        if (request.getAttribute("exists") != null) {
//                            userExist = (boolean) request.getAttribut e("exists");
//                        }
                      
                        %>
                    <ul>
                        <li id="registerTabs" style="list-style: none">User Name <input id="registerTabs2" type="text" name="username"></li>
                        <li id="registerTabs" style="list-style: none">Password <input id="registerTabs2" type="password" name="password"></li>
                        <li id="registerTabs" style="list-style: none">Re-enter Password <input id="registerTabs2" type="password" name="password2"></li>
                        <li id="registerTabs" style="list-style: none">Email <input id="registerTabs2" type="email" name="email"></li>
                        <li id="registerTabs" style="list-style: none">First Name <input id="registerTabs2" type="fName" name="fName"></li>
                        <li id="registerTabs" style="list-style: none">Last Name <input id="registerTabs2" type="sName" name="sName"></li>
<!--                        <li id="registerTabs" style="list-style: none">Profile Picture <input id="registerTabs2" type="file" name="upfile"></li>-->
                    </ul>
                    <br/>
                    <button <input type="submit" id="registerBtn" type="button" class="btn btn-default">Sign Up</button>
                </form>
            </div>
        </article>
    </body>
</html>
