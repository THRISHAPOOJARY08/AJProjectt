package com.servlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.model.Product;
import com.dao.ProductDAO;

@WebServlet("/DeleteProductServlet")
public class DeleteProductServlet extends HttpServlet {
    // GET: Search for product details
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Product p = new ProductDAO().getProductById(id);
            if (p != null) {
                request.setAttribute("product", p);
                request.getRequestDispatcher("productdelete_confirm.jsp").forward(request, response);
            } else {
                response.sendRedirect("productdelete_search.jsp?msg=ID Not Found");
            }
        } catch (Exception e) { response.sendRedirect("productdelete_search.jsp?msg=Error"); }
    }
    // POST: Final Deletion
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            new ProductDAO().deleteProduct(id);
            response.sendRedirect("index.jsp?msg=Deleted Successfully");
        } catch (Exception e) { e.printStackTrace(); }
    }
}