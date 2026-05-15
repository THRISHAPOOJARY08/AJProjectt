package com.servlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.model.Product;
import com.dao.ProductDAO;

@WebServlet("/UpdateProductServlet")
public class UpdateProductServlet extends HttpServlet {
    // GET: Search for product to edit
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Product p = new ProductDAO().getProductById(id);
            if (p != null) {
                request.setAttribute("product", p);
                request.getRequestDispatcher("productupdate_edit.jsp").forward(request, response);
            } else {
                response.sendRedirect("productupdate_search.jsp?msg=ID Not Found");
            }
        } catch (Exception e) { response.sendRedirect("productupdate_search.jsp?msg=Error"); }
    }
    // POST: Final Update
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Product p = new Product(Integer.parseInt(request.getParameter("id")), request.getParameter("name"), 
                        request.getParameter("category"), Double.parseDouble(request.getParameter("price")), 
                        Integer.parseInt(request.getParameter("qty")));
            new ProductDAO().updateProduct(p);
            response.sendRedirect("index.jsp?msg=Updated Successfully");
        } catch (Exception e) { e.printStackTrace(); }
    }
}