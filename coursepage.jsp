<%--
  Created by IntelliJ IDEA.
  User: yanxili
  Date: 4/4/18
  Time: 1:08 AM
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
        session = request.getSession();
        JdbcClass jdbc = (JdbcClass)session.getAttribute("jdbc");
        int currentuserid = (int)session.getAttribute("currentuser");
        int courseid = (int)session.getAttribute("coursechoosen");
        List<Announcement> AnnouncementList = jdbc.getAnnouncementListForCourse(courseid);
        List<Question> QuestionList = jdbc.getQuestionListForCourse(courseid);
        String type = (String) session.getAttribute("clicktype");//whether Announcement or Post
        int index = (int) session.getAttribute("index");//default is 0 in Announcement if the user from public page

    %>
    <head>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css?family=Shadows+Into+Light" rel="stylesheet">
        <link href="coursepage.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Montserrat|Open+Sans" rel="stylesheet">
        <title>Course Page</title>
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
                    <div id="postsearch">
                        <button style="float:left;" id="postbutton">New Post</button>
                        <form style="float:left;">
                            <label style="margin-left:20px;"  for="search">Search: </label><input type="text" class="enjoy-css" id="search" style="width: 50%;"/>
                        </form>
                    </div>
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
                    <%
                        if(type == "announcement"){
                    %>
                    <div id="announcement">
                        <h2 class="infotype">Announcement</h2>
                        <h2 class="title">Title</h2>
                        <div id="announcementcontent">

                        </div>
                    </div>
                    <div id="comment">


                    </div>
                    <%
                        }else if(type == "question"){
                    %>
                    <div id="question">
                        <h2 class="infotype">Question</h2>
                        <h2 class="title">Title</h2>
                        <h2 class="title">Category</h2>
                        <div id="questioncontent">

                        </div>
                    </div>
                    <div id="comment">


                    </div>
                    <%}%>
                </div>


            </div>
        </div>
    </body>

    $END$
    </body>
    <script>
        var coll = document.getElementsByClassName("collapsible");
        var i;

        for(i = 0; i < coll.length; i++){
            coll[i].addEventListener("click", function(){
                this.classList.toggle("active");
                var content = this.nextElementSibling;
                if (content.style.display === "block") {
                    content.style.display = "none";
                } else {
                    content.style.display = "block";
                }
            })
        }

    </script>
    <script>
        function Myprofile(){
            if(currentuser2.type() == "student"){
                window.location = "studentprofile.jsp";
            }else if(currentuser2.type() == "professor"){
                window.location = "professorprofile.jsp";
            }
        }
        function ClickAnnouncement(index){
            var xhttp = new XMLHttpRequest();
            xhttp.open("GET","ChoosePostInCourse?&clicktype=" + "announcement" +
                "&index=" + index,false);
            xhttp.send();
            window.location = xhttp.responseText;
        }
        function ClickQuestion(index){
            var xhttp = new XMLHttpRequest();
            xhttp.open("GET","ChoosePostInCourse?&clicktype=" + "question" +
                "&index=" + index,false);
            xhttp.send();
            window.location = xhttp.responseText;
        }
        function EndorseQuestion(index){
            var xhttp = new XMLHttpRequest();
            xhttp.open("GET","Endorse?&endorsetype=" + "question" +
                "&index=" + index,false);
            xhttp.send();
            window.location = xhttp.responseText;
        }
        function EndorseAnswer(index1,index2){

        }
    </script>
    </html>