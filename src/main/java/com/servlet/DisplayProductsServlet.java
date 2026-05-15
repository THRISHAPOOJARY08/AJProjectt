package com.servlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.dao.ProductDAO;

@WebServlet("/DisplayProductsServlet")
public class DisplayProductsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            request.setAttribute("list", new ProductDAO().getAllProducts());
            request.getRequestDispatcher("productdisplay.jsp").forward(request, response);
        } catch (Exception e) { e.printStackTrace(); }
    }
}