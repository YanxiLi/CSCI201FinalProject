package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ChoosePostInCourse", urlPatterns = {"/ChoosePostInCourse"})
public class ChoosePostInCourse extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String clicktype = request.getParameter("clicktype1");
        String in = request.getParameter("index");
        int index = Integer.parseInt(in);
        HttpSession session = request.getSession();
        session.setAttribute("clicktype", clicktype);
        session.setAttribute("index",index);
        PrintWriter out = response.getWriter();
        out.println("coursepage.jsp");
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}