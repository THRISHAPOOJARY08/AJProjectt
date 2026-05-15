package com.servlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.model.Product;
import com.dao.ProductDAO;

@WebServlet("/AddProductServlet")
public class AddProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            new ProductDAO().addProduct(new Product(0, request.getParameter("name"), request.getParameter("category"), 
                Double.parseDouble(request.getParameter("price")), Integer.parseInt(request.getParameter("qty"))));
            response.sendRedirect("index.jsp?msg=Added successfully");
        } catch (Exception e) { e.printStackTrace(); }
    }
}