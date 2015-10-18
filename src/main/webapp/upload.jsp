<%-- 
    Document   : upload
    Created on : Sep 22, 2014, 6:31:50 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Instagrim</title>
        <link rel="stylesheet" type="text/css" href="/Instagrim/Bootstrap/bootstrap.css" />
        <link href='https://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'/>
        <link rel="stylesheet" type="text/css" href="style.css" />
    </head>
    <body>
      
        <nav id="navbar" class="navbar navbar-default navbar-static-top">
            <div class="container">
                <ul id="tabs" class="nav nav-tabs">
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="upload.jsp">Upload</a></li>
                    <li><a href="/Instagrim/Images/majed">Sample Images</a></li>
                </ul>
            </div>
        </nav>
         <div id="uploadFormBody" class="jumbotron">
                <div class="container">
                     <h1>InstaGrim ! </h1>
                     <h2>Upload your photos here</h2>
                </div>
         </div>
            <div class="container">
            <form id="uploadForm" method="POST" enctype="multipart/form-data" action="Image">
                File to upload: <input type="file" name="upfile"><br/>

                <br/>
                <a href=""<button id="uploadBtn" type="submit" class="btn btn-default">Upload</button>
                <!--<input type="submit" value="Press"> to upload the file!-->
                </div>
            </form>
    </body>
</html>
