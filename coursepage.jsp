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
        session.setAttribute("posterror", "");
        JdbcClass jdbc = (JdbcClass)session.getAttribute("jdbc");
        int currentuserid = (int)session.getAttribute("currentuser");
        int courseid = (int)session.getAttribute("coursechoosen");
        List<Announcement> AnnouncementList = jdbc.getAnnouncementListForCourse(courseid);
        List<Question> QuestionList = jdbc.getQuestionListForCourse(courseid);
        String type = (String) session.getAttribute("clicktype");//whether Announcement or Post
        int index = (int) session.getAttribute("index");//default is 0 in Announcement if the user from public page
        session.setAttribute("posterror", "");
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
                <img onclick="window.location='fakepublicpage.jsp'" style="height: 100px;" src="Logo.png">
                <img style="position:absolute; top:30px;left:680px; " src="logo2.png">
                <i class="fa fa-envelope" style="font-size:48px;color:white"></i>
                <a><%=jdbc.getUserName(currentuserid)%></a>
                <a style="margin-left: 20px;">Log out</a>
            </div>
            <div id="result">
                <div id="left">
                    <form style="float:left;" method="GET" action="postincoursepage.jsp">
                        <button style="float:left;" id="postbutton">New Post</button>
                    </form>
                    <div style="clear:both;"></div>
                    <button class="collapsible">Annoucements</button>
                    <div class="content">
                        <%for(int i=0; i<5; i++){
                            if(i >= AnnouncementList.size()){
                                break;
                            }%>

                        <div id="<%="announcement" + (i+1)%>" class="block">
                            <a onclick="return ClickAnnouncement(<%=i%>);"><%=AnnouncementList.get(i).getTitle()%></a>
                        </div>

                        <%}%>
                    </div>

                    <button class="collapsible">Hide Rest Announcements</button>
                    <div class="content1">
                        <%for(int i=5; i<AnnouncementList.size(); i++){%>

                        <div id="<%="announcement" + (i+1)%>" class="block">
                            <a onclick="return ClickAnnouncement(<%=i%>);"><%=AnnouncementList.get(i).getTitle()%></a>
                        </div>

                        <%}%>
                    </div>
                    <button class="collapsible">Questions</button>
                    <div class="content">
                        <%for(int i=0; i<QuestionList.size(); i++){%>

                        <div id="<%="question" + (i+1)%>" class="block">
                            <a onclick="return ClickQuestion(<%=i%>);"><%=QuestionList.get(i).getTitle()%></a>
                        </div>

                        <%}%>
                    </div>
                </div>

                <div id="right">
                    <%
                        if(type.equalsIgnoreCase("announcement")){
                    %>
                    <div id="announcement">
                        <h2 class="infotype">Announcement</h2>
                        <div id="leftside1">
                            <div id="title1" style="margin-top: 10px;">
                                <strong><p>Title: <%=AnnouncementList.get(index).getTitle()%></p></strong>
                            </div>
                            <div id="content1">
                                <p>Content: <%=AnnouncementList.get(index).getContent()%></p>
                            </div>
                        </div>
                        <div id="rightside1">
                            <div id="authorimage1">
                                <img src="<%=jdbc.getUserImageURL(AnnouncementList.get(index).getSenderId())%>" class="center">
                            </div>
                            <div id="authorname1">
                                @<%=jdbc.getUserName(AnnouncementList.get(index).getSenderId())%>
                            </div>
                            <div style="text-align: center;">
                                <%=AnnouncementList.get(index).getPostDate()%>
                            </div>
                        </div>
                    </div>
                    <div style="clear:both;"></div>
                    <div id="comment">
                        <h2 style="margin-left:10px;">Followup: </h2>
                        <%
                            List<Comment> CommentList = jdbc.getCommentListToAnnouncement(AnnouncementList.get(index).getId());
                            for(int j=0; j<CommentList.size(); j++){%>
                        <div class="followupbox">
                            <p><%=CommentList.get(j).getContent()%></p>
                            <br/>
                            <p style="position:absolute; bottom: 0; left:650px;">Answered by: <%=jdbc.getUserName(CommentList.get(j).getUserId())%>  <%=CommentList.get(j).getTimeAdded()%></p>
                        </div>
                        <%}%>
                        <form method="GET" action="NewInput">
                            <input type="text" name="newinput">
                            <input type="submit" value="Submit">
                            <input type="hidden" value="comment"  name="inputtype">
                            <input type="hidden" value="announcement"  name="totype">
                            <input type="hidden" value="<%=AnnouncementList.get(index).getId()%>"  name="id">
                        </form>
                    </div>
                    <%
                        }else if(type.equalsIgnoreCase("question")){
                            List<Answer> AnswerList = jdbc.getAnswerList(QuestionList.get(index).getId());
                    %>
                    <div id="question">
                        <h2 class="infotype">Question</h2>
                        <div id="leftside2">
                            <div id="title2" style="margin-top: 10px;">
                                <strong><p>Title: <%=QuestionList.get(index).getTitle()%></p></strong>
                            </div>
                            <div id="content2">
                                <p>Content: <%=QuestionList.get(index).getContent()%></p>
                            </div>
                            <div id="endorsement2">
                                <%if(!jdbc.checkEndorsementOnQuestion(currentuserid,QuestionList.get(index).getId())){%>
                                    <button class="btn" onclick="EndorseQuestion(<%=QuestionList.get(index).getId()%>)">Endorse it!</button>
                                <%}%>
                                <%=jdbc.getQuestionEndorsementNumber(QuestionList.get(index).getId())%> endorsement!
                            </div>
                        </div>
                        <div id="rightside2">
                            <div id="authorimage2">
                                <img src="<%=jdbc.getUserImageURL(QuestionList.get(index).getUser_id())%>" class="center">
                            </div>
                            <div id="authorname2">
                                @<%=jdbc.getUserName(QuestionList.get(index).getUser_id())%>
                            </div>
                            <div style="text-align: center;">
                                <%=QuestionList.get(index).getTime()%>
                            </div>
                        </div>

                    </div>
                    <div style="clear:both;"></div>
                    <div id="answer">
                        <h2 style="margin-left:10px;">Answers:</h2>
                        <%
                            for(int i=0; i<AnswerList.size();i++){%>
                        <div class="answerbox">
                            <p><%=AnswerList.get(i).getContent()%></p>
                            <br/>
                            <%if(!jdbc.checkEndorsementOnAnswer(currentuserid,AnswerList.get(i).getId())){%>
                                <button style="float:left;" class="answerbtn" onclick="EndorseAnswer(<%=AnswerList.get(i).getId()%>)">Endorse it!</button>
                            <%}%>
                            <p style="float:left;position:absolute; bottom: -10px; left:120px;"><%=jdbc.getAnswerEndorsementNumber(AnswerList.get(i).getId())%> Endorsement</p>
                            <div style="clear:both;"></div>
                            <p style="position:absolute; bottom: 0; left:750px;">Answered by: <%=jdbc.getUserName(AnswerList.get(i).getId())%>  <%=AnswerList.get(i).getTime()%></p>

                        </div>
                        <%
                            List<Comment> CommentList = jdbc.getCommentListToAnswer(AnswerList.get(i).getId());
                            for(int j=0; j<CommentList.size(); j++){
                        %>
                        <div class="followupbox">
                            <p><%=CommentList.get(j).getContent()%></p>
                            <br/>
                            <p style="position:absolute; bottom: 0; left:650px;">Answered by: <%=jdbc.getUserName(CommentList.get(j).getUserId())%>  <%=CommentList.get(j).getTimeAdded()%></p>
                        </div>
                            <%}%>
                            <form method="GET" action="NewInput">
                                <input type="text" name="newinput">
                                <input type="submit" value="Submit">
                                <input type="hidden" value="comment"  name="inputtype">
                                <input type="hidden" value="answer"  name="totype">
                                <input type="hidden" value="<%=AnswerList.get(i).getId()%>"  name="id">
                            </form>
                            <%}%>
                        <form method="GET" action="NewInput">
                            <input type="text" name="newinput">
                            <input type="submit" value="Submit">
                            <input type="hidden" value="answer"  name="inputtype">
                            <input type="hidden" value="question"  name="totype">
                            <input type="hidden" value="<%=QuestionList.get(index).getId()%>"  name="id">
                        </form>
                    </div>
                    <%}%>
                </div>
            </div>
        </div>
    </body>

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
            xhttp.open("GET","ChoosePostInCourse?&clicktype1=" + "announcement" +
                "&index=" + index,false);
            xhttp.send();
            window.location = xhttp.responseText;
        }
        function ClickQuestion(index){
            var xhttp = new XMLHttpRequest();
            xhttp.open("GET","ChoosePostInCourse?&clicktype1=" + "question" +
                "&index=" + index,false);
            xhttp.send();
            window.location = xhttp.responseText;
        }
        function EndorseQuestion(index){
            var xhttp = new XMLHttpRequest();
            xhttp.open("GET","Endorse?&endorsetype=" + "question" +
                "&id=" + index,false);
            xhttp.send();
            //window.location = xhttp.responseText;
            window.location.reload();
        }
        function EndorseAnswer(index){
            var xhttp = new XMLHttpRequest();
            xhttp.open("GET","Endorse?&endorsetype=" + "answer" +
                "&id=" + index,false);
            xhttp.send();
            //window.location = xhttp.responseText;
            window.location.reload();
        }
        function NewPost(){
            window.location = "postincoursepage.jsp";
        }
    </script>
    </html>