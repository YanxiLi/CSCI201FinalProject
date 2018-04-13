<%@ page import="javax.websocket.Session" %>
<%@ page import="finalproject.JdbcClass" %>
<%@ page import="java.util.List" %>
<%@ page import="javafx.util.Pair" %><%--
  Created by IntelliJ IDEA.
  User: Braelyn
  Date: 11/04/2018
  Time: 10:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Profile Page</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css?family=Shadows+Into+Light" rel="stylesheet">
    <%
        JdbcClass jdbc = new JdbcClass();
        int userID = (Integer) session.getAttribute("currentuser");

        //user name
        String lname = jdbc.getUserLastName(userID);
        String fname = jdbc.getUserFirstName(userID);
        System.out.print(fname + " " + lname);
        String userName = fname + " " + lname;
        //Students have both questions and answers, Profs only have answers
        List<String> classes = null;
        if(userID == 1) {
        classes = jdbc.getCourseNameTakingForUser(userID);
        }
        else if(userID == 2) {
        classes = jdbc.getCourseNameTeachingForUser(userID);
        }
        System.out.print(classes);

        List<Pair<String, String>> questions = jdbc.getQuestionsListForUesr(userID);
        List<Pair<String, String>> answers = jdbc.getAnswersListForUser(userID);

        List<String> preferences = jdbc.getPreferenceForUser(userID);

        String imageURL = jdbc.getUserImageURL(userID);
    %>
    <style type="text/css">

        body, html
        {
            padding: 0px;
            margin: 0px;
            font-family: 'Shadows Into Light';
        }
        #header {
            width: 100%;
            top: 0;
            left: 0;
            height: 100px;
            background-color: #85C7B6;
        }
        .logoText {
            margin-left: auto;
            margin-right: auto;
            width: 200px;
        }
        .logoText img {
            width: 100%;
            padding-top: 22px;
            /*border-radius: 20%;*/
        }
        .relative_left {
            position: absolute;
            top: 0;
            left: 0;
            z-index: 1;
        }
        .relative_right {
            position: absolute;
            top: 0;
            right: 0;
            z-index: 1;
            width: 500px;
            display: flex;
            flex-wrap: nowrap;
        }
        .relative_right > div {
            width: 125px;
            font-size: 25px;
            text-align: center;
            padding-top: 30px;
        }
        .relative_right a {
            text-decoration: none;
            color: black;
        }
        .relative_left img {
            width: 100px;
            height: 100px;
        }
        .content {
            margin-top: 0;
            margin-left: auto;
            margin-right: auto;
            width: 1000px;

            height: 1000px;
            background-color: pink;
        }
        .left_col {
            float: left;
            width: 30%;
            text-align: center;

            background-color: pink;
            height: 400px;
        }
        .profile_pic img {
            width: 90%;
            border-radius: 50%;
            margin-top: 50px;
        }
        .right_col {
            float: left;
            width: 70%;
            text-align: center;

            height: 400px;
            background-color: navajowhite;
        }
        .user_name {
            font-size: 45px;
            font-weight: bold;
        }
        .school_name {
            font-size: 40px;
        }
        .info_area {
            width: 95%;
            margin-left: auto;
            margin-right: auto;

            height: 400px;
        }
        .options {
            display: flex;
            flex-wrap: nowrap;
            list-style: none;
            padding-left: 0;
            margin-bottom: 0;

        }
        .options > li {
            width: 100px;
            margin-right: 3px;
            border: 1px solid black;
            border-bottom: 0;
            border-top-left-radius: 30%;
            border-top-right-radius: 30%;
            font-size: 20px;
        }
        .user_info {
            border: 1px solid black;
            height: 400px;
        }

        /*i {*/
        /*position:relative;*/
        /*left:75%;*/
        /*top:-35px;*/
        /*}*/
        /*#touxiang {*/
        /*position:relative;*/
        /*left:850px;*/
        /*top:-20px;*/
        /*height:80px;*/
        /*}*/
        /*#logout{*/
        /*position:relative;*/
        /*left:80%;*/
        /*top:-45px;*/
        /*height:80px;*/
        /*color:white;*/
        /*font-family: 'Shadows Into Light';*/
        /*}*/


    </style>
</head>
<body>
<div id="header">
    <div class="logoText">
        <img src="201fp_mockup/MondayText.png">
    </div>
</div>

<div class="relative_left" id="logo">
    <img src="201fp_mockup/MondayLogo.png">
</div>

<div class="relative_right">

    <div class="envolop">
        <i class="fa fa-envelope" ></i>
    </div>

    <div class="toPublicPage">
        <a href="PublicPage.jsp">Public Page</a>
    </div>

    <div class="toProfilePage">
        <a id="myName" href="ProfilePage.jsp"></a>
    </div>

    <div class="logout">
        <a href="" id="logout">Log Out</a>
    </div>

</div>

<div class="content">
    <div class="left_col">
        <div class="profile_pic">
            <img id="photo" src="" />
        </div>
        <div class="credibility">

        </div>
    </div>

    <div class="right_col">
        <div class="user_name">
            Zhixu Li
        </div>
        <div class="school_name">
            University of Southern California
        </div>
        <div class="info_area">
            <ul class="options">
                <li id="classes">Classes</li>
                <li id="preferences">Preferences</li>
                <li id="questions">Questions</li>
                <li id="answers">Answers</li>
            </ul>

            <div class="user_info" id="user_info">

            </div>
        </div>
    </div>
</div>

<script>
    document.getElementById("myName").innerHTML = <%= userName  %> ;
    document.getElementById("photo").src = <%= imageURL%>;

    function clearUserInfo() {
        var div = document.getElementById("user_info");
        while (div.firstChild) {
            div.removeChild(div.firstChild);
        }
    }

    function loadClasses() {
        clearUserInfo();

        var classList = document.createElement("ul");
        classList.id = "classList";
        <%
        for(int i=0; i<classes.size(); i++) {
        %>
        var myClass = document.createElement("li");
        myClass.id = "myClass";
        myClass.innerHTML = <%= classes.get(i)%>;
        classList.appendChild(myClass);
        <%
        }
        %>
        document.getElementById("user_info").appendChild(classList);
    }

    loadClasses();

    document.getElementById("classes").onclick = loadClasses();

    document.getElementById("preferences").onclick = function() {
        clearUserInfo();

        var prefList = document.createElement("ul");
        prefList.id = "prefList";
        <%
        for(int i=0; i<preferences.size(); i++) {
        %>
            var myPref = document.createElement("li");
            myPref.id = "myPref";
            myPref.innerHTML = <%= preferences.get(i)%>;
            prefList.appendChild(myPref);
        <%
        }
        %>
        document.getElementById("user_info").appendChild(prefList);
    }

    document.getElementById("questions").onclick = function() {
        clearUserInfo();

        var questionDiv = document.createElement("div");
        questionDiv.id = "questionDiv";
        <%
        for(int i=0; i<questions.size(); i++) {
        %>
            var eachQuestion = document.createElement("div");
            eachQuestion.id = "eachQuestion";
            var questionTitle = document.createElement("h3");
            questionTitle.id = "questionTitle";
            questionTitle.innerHTML = <%= questions.get(i).getKey() %>;
            var questionContent = document.createElement("p");
            questionContent.id = "questionContent";
        <%
            String content = questions.get(i).getValue();
            if(content.length() > 400) {
                content = content.substring(0, 400) + "...";
            }
        %>
            questionContent.innerHTML = <%= content %>;
            eachQuestion.appendChild(questionTitle);
            eachQuestion.appendChild(questionContent);
            questionDiv.appendChild(eachQuestion);
        <%
        }
        %>
        document.getElementById("user_info").appendChild(questionDiv);
    }

    document.getElementById("answers").onclick = function() {
        clearUserInfo();

        var answerDiv = document.createElement("div");
        answerDiv.id = "answerDiv";
        <%
        for(int i=0; i<answers.size(); i++) {
        %>
        var eachAnswer = document.createElement("div");
        eachAnswer.id = "eachAnswer";
        var answerTitle = document.createElement("h3");
        answerTitle.id = "answerTitle";
        answerTitle.innerHTML = <%= answers.get(i).getKey() %>;
        var answerContent = document.createElement("p");
        answerContent.id = "answerContent";
        <%
            String content = answers.get(i).getValue();
            if(content.length() > 400) {
                content = content.substring(0, 400) + "...";
            }
        %>
        answerContent.innerHTML = <%= content %>;
        eachAnswer.appendChild(answerTitle);
        eachAnswer.appendChild(answerContent);
        answerDiv.appendChild(eachAnswer);
        <%
        }
        %>
        document.getElementById("user_info").appendChild(answerDiv);
    }
</script>
</body>
</html>