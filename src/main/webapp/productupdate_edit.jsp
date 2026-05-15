<%@ page import="com.model.Product" %>
<%@ include file="navbar.jsp" %>
<% Product p = (Product)request.getAttribute("product"); %>
<div class="container col-md-4 card p-4 shadow">
    <h3 class="text-center">Edit Product Details</h3>
    <% if(p!=null){ %>
    <form action="UpdateProductServlet" method="post">
        <input type="hidden" name="id" value="<%=p.getProductId()%>">
        
        <label class="fw-bold">Product ID</label>
        <input type="text" class="form-control mb-3 bg-light" value="<%=p.getProductId()%>" readonly>

        <label class="fw-bold">Name</label>
        <input type="text" name="name" class="form-control mb-3" value="<%=p.getProductName()%>" required>
        
        <label class="fw-bold">Category</label>
        <select name="category" class="form-select mb-3">
            <% 
                String currentCat = p.getCategory();
                String[] cats = {
                    "Electronics", "Furniture", "Grocery", "Mobile", "Clothing", 
                    "Footwear", "Home Appliances", "Stationery", "Toys & Games", 
                    "Health & Beauty", "Sports & Outdoors", "Automotive", "Books", 
                    "Jewellery", "Pet Supplies"
                };
                for(String cat : cats) {
                    String selected = (cat.equals(currentCat)) ? "selected" : "";
            %>
                <option value="<%=cat%>" <%=selected%>><%=cat%></option>
            <% } %>
        </select>
        
        <label class="fw-bold">Price (Rs)</label>
        <input type="number" step="10" name="price" class="form-control mb-3" value="<%=p.getPrice()%>" required>
        
        <label class="fw-bold">Quantity</label>
        <input type="number" name="qty" class="form-control mb-3" value="<%=p.getQuantity()%>" required>
        
        <button class="btn btn-primary w-100" onclick="return confirm('Update this product?')">Save Changes</button>
    </form>
    <% } %>
</div>