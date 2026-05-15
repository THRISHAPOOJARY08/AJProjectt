package com.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.model.Product; 
import com.dao.ProductDAO;

@WebServlet("/ReportCriteriaServlet")
public class ReportCriteriaServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String type = request.getParameter("type");
            String val = request.getParameter("val");
            ProductDAO dao = new ProductDAO();
            List<Product> list = "top".equals(type) ? dao.getTopProducts(Integer.parseInt(val)) : dao.getReport(type, val);
            request.setAttribute("list", list);
            request.getRequestDispatcher("report_result.jsp").forward(request, response);
        } catch (Exception e) { e.printStackTrace(); }
    }
}