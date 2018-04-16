package servlet;

import jdbc.JdbcClass;
import users.NormUser;
import users.Professor;
import users.Student;
import users.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ChooseCoursePage", urlPatterns = {"/ChooseCoursePage"})
public class ChooseCoursePage extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*
        String coursetype = request.getParameter("coursetype");
        String in = request.getParameter("index");
        int index = Integer.parseInt(in);
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();
        User currentuser = (User)session.getAttribute("currentuser");
        Course c;
        if(coursetype == "coursetaking"){
            Student currentuser2 = (Student) currentuser;
            c = currentuser2.getCourseTakingId().get(index);
        }else if(coursetype == "courseteaching") {
            if (currentuser.type() == "professor") {
                Professor currentuser2 = (Professor) currentuser;
                c = currentuser2.getCoursesTeachingId().get(index);
            } else if (currentuser.type() == "student") {
                Student currentuser2 = (Student) currentuser;
                c = currentuser2.getCourseTeachingId().get(index);
            }
        }
        session.setAttribute("coursechoosen", c);
        out.println("coursepage.jsp");*/
        JdbcClass jdbc = new JdbcClass();
        String in = request.getParameter("courseId");
        int courseid = Integer.parseInt(in);
        in = request.getParameter("userId");
        int userid = Integer.parseInt(in);
        HttpSession session = request.getSession();
        session.setAttribute("coursechoosen", courseid);
        session.setAttribute("clicktype", "announcement");
        session.setAttribute("index",0);
        session.setAttribute("currentuser",userid);
        session.setAttribute("jdbc",jdbc);
        String pageToForward = "/coursepage.jsp";
        RequestDispatcher dispatch = getServletContext().getRequestDispatcher(pageToForward);
        dispatch.forward(request,response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
