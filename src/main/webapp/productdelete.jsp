<%@ page import="com.model.Product" %>
<%@ include file="navbar.jsp" %>

<div class="container col-md-6 mt-4">
    <!-- SEARCH SECTION -->
    <div class="card shadow-sm border-0 p-4 mb-4">
        <h4 class="text-secondary mb-3">Delete Product</h4>
        <p class="text-muted small">Enter the Product ID to retrieve details and confirm deletion.</p>
        
        <!-- Updated Action: Points to DeleteProductServlet (GET) -->
        <form action="DeleteProductServlet" method="get" class="d-flex shadow-sm p-2 rounded border">
            <input type="number" name="id" class="form-control border-0" placeholder="Enter ID (e.g. 101)" required>
            <button type="submit" class="btn btn-warning px-4 fw-bold">Search</button>
        </form>
    </div>

    <!-- DETAILS & CONFIRMATION SECTION -->
    <% 
        Product p = (Product) request.getAttribute("product"); 
        
        // Check if a search was performed (ID was passed) but no product was found
        if (request.getParameter("id") != null && p == null) { 
    %>
        <div class="alert alert-warning text-center shadow-sm">
            <strong>Not Found!</strong> No product exists with ID: <%= request.getParameter("id") %>
        </div>
    <% 
        } 

        // If product is found, display details and the final delete button
        if(p != null) { 
    %>
    <div class="card shadow border-danger">
        <div class="card-header bg-danger text-white">
            <h5 class="mb-0">Confirm Deletion</h5>
        </div>
        <div class="card-body bg-light">
            <div class="row">
                <div class="col-6">
                    <p class="mb-1 text-muted small text-uppercase">Product Name</p>
                    <h5 class="fw-bold"><%= p.getProductName() %></h5>
                </div>
                <div class="col-6">
                    <p class="mb-1 text-muted small text-uppercase">ID</p>
                    <h5 class="fw-bold"><%= p.getProductId() %></h5>
                </div>
            </div>
            <hr>
            <div class="row">
                <div class="col-6">
                    <p class="mb-1 text-muted small">Category: <strong><%= p.getCategory() %></strong></p>
                </div>
                <div class="col-6">
                    <p class="mb-1 text-muted small">Price: <strong>Rs <%= p.getPrice() %></strong></p>
                </div>
            </div>

            <div class="mt-4">
                <!-- Updated Action: Points to DeleteProductServlet (POST) -->
                <form action="DeleteProductServlet" method="post" onsubmit="return confirm('WARNING: This action cannot be undone. Are you sure you want to delete this product?')">
                    <input type="hidden" name="id" value="<%=p.getProductId()%>">
                    
                    <div class="d-grid gap-2">
                        <button type="submit" class="btn btn-danger btn-lg">Permanently Delete</button>
                        <a href="index.jsp" class="btn btn-outline-secondary">Cancel and Go Back</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <% } %>
</div>