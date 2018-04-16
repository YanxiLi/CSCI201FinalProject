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

@WebServlet(name = "NewInput", urlPatterns = {"/NewInput"})
public class NewInput extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            String inputtype = request.getParameter("inputtype");
            String totype = request.getParameter("totype");
            String in = request.getParameter("id");
            int id = Integer.parseInt(in);
            String content = request.getParameter("newinput");
            HttpSession session = request.getSession();
            JdbcClass jdbc = (JdbcClass)session.getAttribute("jdbc");
            int currentuserid = (int)session.getAttribute("currentuser");
            LocalDateTime time = LocalDateTime.now();
            if(inputtype.equalsIgnoreCase("answer")){
                int postid = jdbc.getPostId(id);
                jdbc.postAnswerToQuestion(time, content, currentuserid, postid);
            }else if(inputtype.equalsIgnoreCase("comment")){
                if(totype.equalsIgnoreCase("announcement")){
                    jdbc.postCommentToAnnouncement(time, currentuserid, content, id);
                }else if(totype.equalsIgnoreCase("answer")){
                    jdbc.postCommentToAnswer(time, currentuserid, content, id);
                }
            }
            String pageToForward = "/coursepage.jsp";
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
