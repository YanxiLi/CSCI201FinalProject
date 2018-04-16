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

@WebServlet(name = "Endorse", urlPatterns = {"/Endorse"})
public class Endorse extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            String endorsetype = request.getParameter("endorsetype");
            String in = request.getParameter("id");
            int id = Integer.parseInt(in);
            HttpSession session = request.getSession();
            JdbcClass jdbc = (JdbcClass)session.getAttribute("jdbc");
            int currentuserid = (int)session.getAttribute("currentuser");
            if(endorsetype.equalsIgnoreCase("question")){
                System.out.println("hey");
                jdbc.endorseQuestion(currentuserid,id);
            }else if(endorsetype.equalsIgnoreCase("answer")){
                jdbc.endorseAnswer(currentuserid,id);
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
