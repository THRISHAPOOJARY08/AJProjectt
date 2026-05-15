<%@ page import="com.model.Product" %>
<%@ include file="navbar.jsp" %>
<% Product p = (Product)request.getAttribute("product"); %>
<div class="container col-md-5 card p-4 shadow">
    <h3 class="text-danger text-center">Confirm Product Deletion</h3>
    <hr>
    <% if(p!=null){ %>
        <div class="row mb-3">
            <div class="col-6"><strong>Product ID:</strong></div><div class="col-6"><%=p.getProductId()%></div>
        </div>
        <div class="row mb-3">
            <div class="col-6"><strong>Product Name:</strong></div><div class="col-6"><%=p.getProductName()%></div>
        </div>
        <div class="row mb-3">
            <div class="col-6"><strong>Category:</strong></div><div class="col-6"><%=p.getCategory()%></div>
        </div>
        <div class="row mb-3">
            <div class="col-6"><strong>Price:</strong></div><div class="col-6">Rs <%=p.getPrice()%></div>
        </div>
        <div class="row mb-3">
            <div class="col-6"><strong>Current Quantity:</strong></div><div class="col-6"><%=p.getQuantity()%></div>
        </div>
        
        <div class="alert alert-warning text-center">
            Warning: This action cannot be undone!
        </div>

        <form action="DeleteProductServlet" method="post" onsubmit="return confirm('Confirm Permanent Delete?')">
            <input type="hidden" name="id" value="<%=p.getProductId()%>">
            <div class="row">
                <div class="col-6"><button class="btn btn-danger w-100">Delete Now</button></div>
                <div class="col-6"><a href="index.jsp" class="btn btn-secondary w-100">Cancel</a></div>
            </div>
        </form>
    <% } else { %> 
        <div class="text-center">
            <h3>Product Not Found</h3>
            <a href="productdelete_search.jsp" class="btn btn-primary mt-3">Try Again</a>
        </div>
    <% } %>
</div>