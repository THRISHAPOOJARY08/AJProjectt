<%@ page import="com.dao.ProductDAO" %>
<%@ include file="navbar.jsp" %>
<% 
    ProductDAO dao = new ProductDAO();
    int nextId = dao.getNextAutoId(); 
%>
<div class="container col-md-4 card p-4 shadow">
    <h3 class="text-center mb-4">Add Product</h3>
    <form action="AddProductServlet" method="post">
        <label class="fw-bold">Automated Generated ID</label>
        <input type="text" class="form-control mb-3 bg-light" value="<%=nextId%>" readonly>
        
        <label class="fw-bold">Product Name</label>
        <input type="text" name="name" class="form-control mb-3" required>
        
        <label class="fw-bold">Category</label>
        <select name="category" class="form-select mb-3" required>
            <option value="" disabled selected>-- Select Category --</option>
            <option>Electronics</option>
            <option>Furniture</option>
            <option>Grocery</option>
            <option>Mobile</option>
            <option>Clothing</option>
            <option>Footwear</option>
            <option>Home Appliances</option>
            <option>Stationery</option>
            <option>Toys & Games</option>
            <option>Health & Beauty</option>
            <option>Sports & Outdoors</option>
            <option>Automotive</option>
            <option>Books</option>
            <option>Jewellery</option>
            <option>Pet Supplies</option>
        </select>
        
        <label class="fw-bold">Price (Rs)</label>
        <input type="number" step="10" name="price" class="form-control mb-3" required>
        
        <label class="fw-bold">Quantity</label>
        <input type="number" name="qty" class="form-control mb-3" required>
        
        <button type="submit" class="btn btn-success w-100">Save Product</button>
    </form>
</div>