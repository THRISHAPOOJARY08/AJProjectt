package com.servlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.dao.ProductDAO;
import com.model.Product;

@WebServlet("/ProductController")
public class ProductController extends HttpServlet {
    ProductDAO dao = new ProductDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            if ("add".equals(action)) {
                Product p = new Product(0, request.getParameter("name"), request.getParameter("category"), 
                            Double.parseDouble(request.getParameter("price")), Integer.parseInt(request.getParameter("qty")));
                dao.addProduct(p);
                response.sendRedirect("index.jsp?msg=Product Added Successfully");
            } 
            else if ("update".equals(action)) {
                Product p = new Product(Integer.parseInt(request.getParameter("id")), request.getParameter("name"), 
                            request.getParameter("category"), Double.parseDouble(request.getParameter("price")), 
                            Integer.parseInt(request.getParameter("qty")));
                dao.updateProduct(p);
                response.sendRedirect("index.jsp?msg=Product Updated");
            }
            else if ("delete".equals(action)) {
                dao.deleteProduct(Integer.parseInt(request.getParameter("id")));
                response.sendRedirect("index.jsp?msg=Product Deleted");
            }
        } catch (Exception e) { e.printStackTrace(); }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            if ("view".equals(action)) {
                request.setAttribute("list", dao.getAllProducts());
                request.getRequestDispatcher("productdisplay.jsp").forward(request, response);
            }
            else if ("searchUpdate".equals(action) || "searchDelete".equals(action)) {
                Product p = dao.getProductById(Integer.parseInt(request.getParameter("id")));
                request.setAttribute("product", p);
                String page = action.equals("searchUpdate") ? "productupdate.jsp" : "productdelete.jsp";
                request.getRequestDispatcher(page).forward(request, response);
            }
            else if ("report".equals(action)) {
                request.setAttribute("list", dao.getReport(request.getParameter("type"), request.getParameter("val")));
                request.getRequestDispatcher("report_result.jsp").forward(request, response);
            }
        } catch (Exception e) { e.printStackTrace(); }
    }
}