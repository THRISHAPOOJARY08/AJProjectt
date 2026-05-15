package com.servlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.dao.ProductDAO;

@WebServlet("/ReportServlet")
public class ReportServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            request.setAttribute("list", new ProductDAO().getReport(request.getParameter("type"), request.getParameter("val")));
            request.getRequestDispatcher("report_result.jsp").forward(request, response);
        } catch (Exception e) { e.printStackTrace(); }
    }
}