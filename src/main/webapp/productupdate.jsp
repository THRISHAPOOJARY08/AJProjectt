<%@ include file="navbar.jsp" %>
<div class="container col-md-4 card p-4 shadow">
    <h3>Update Product</h3>
    <form action="UpdateProductServlet" method="get">
        <label>Enter Product ID to Edit:</label>
        <input type="number" name="id" class="form-control my-3" required>
        <button class="btn btn-warning w-100">Fetch Details</button>
    </form>
</div>