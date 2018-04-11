package servlet;

import jdbc.JdbcClass;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;

@WebServlet(name = "PostInCourse")
public class PostInCourse extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
            String title = request.getParameter("title");
            String posttype = request.getParameter("posttype");
            String content = request.getParameter("content");
            HttpSession session = request.getSession();
            int currentuserid = (int)session.getAttribute("currentuser");
            int courseid = (int)session.getAttribute("coursechoosen");
            String pageToForward = "";
            JdbcClass jdbc = (JdbcClass)session.getAttribute("jdbc");
            LocalDateTime time = LocalDateTime.now();
            session.setAttribute("posterror", "");
            if(jdbc.ifUserCanPostAnnouncement(currentuserid,courseid)) {
                pageToForward = "coursepage.jsp";
                jdbc.postAnnouncementForCourse(title, content, time, currentuserid, courseid);
            }else{
                pageToForward = "postincoursepage.jsp";
                session.setAttribute("posterror", "Sorry, you cannot post announcement.");
            }
            RequestDispatcher dispatch = getServletContext().getRequestDispatcher(pageToForward);
            dispatch.forward(request,response);
        }catch(SQLException sqle){
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
