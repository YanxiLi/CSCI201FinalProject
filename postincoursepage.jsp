<%--
  Created by IntelliJ IDEA.
  User: yanxili
  Date: 4/10/18
  Time: 11:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         import="users.*"%>
<%@ page import="java.util.List" %>
<%@ page import="jdbc.JdbcClass" %>
<html>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Shadows+Into+Light" rel="stylesheet">
<%
    String postError = (String)session.getAttribute("posterror");
    if(postError == null || postError.equals("")){
        postError = "";
    }
%>
    <head>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css?family=Shadows+Into+Light" rel="stylesheet">
        <link href="coursepage.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Montserrat|Open+Sans" rel="stylesheet">
        <title>New Post in Course Page</title>
    </head>
    <body>
        <div id="outercontainer">
            <div id="header">
                <img onclick="window.location='publicpage.jsp'" style="height: 100px;" src="Logo.png">
                <img style="position:absolute; top:30px;left:680px; " src="logo2.png">
                <i class="fa fa-envelope" style="font-size:48px;color:white"></i>
                <a>Yanxi Li</a>
                <a style="margin-left: 20px;">Log out</a>
            </div>
            <div id="result">
                <div id="left">
                    <button class="collapsible">Annoucements</button>
                    <div class="content">
                        <div id="annoucement1" class="block">

                        </div>
                    </div>


                    <button class="collapsible">Hide Rest Announcements</button>
                    <div class="content1">
                        <div id="announcement6" class="block">

                        </div>
                    </div>

                    <button class="collapsible">Today</button>
                    <div class="content">
                        <div id="question1" class="block">

                        </div>
                    </div>

                </div>
                <div id="right">
                    <form name="mypost" method="GET" action="PostInCourse">
                        Title: <input type="text" id="title" name="title">
                        <h5 color="red"><strong><%= postError %></strong></h5>
                        <div id="radiopart">
                                <input type="radio" name="posttype" value="announcement" checked><strong> Announcement</strong>
                                <input type="radio" name="posttype" value="question"><strong> Question</strong>
                        </div>
                        Content: <input type="text" id="content" name="content">

                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
