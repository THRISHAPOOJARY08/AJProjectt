<%@ page import="java.util.*, com.model.Product" %>
<%@ include file="navbar.jsp" %>
<div class="container">
    <h3>Inventory</h3>
    <table class="table table-striped mt-3">
        <thead><tr><th>ID</th><th>Name</th><th>Category</th><th>Price</th><th>Qty</th></tr></thead>
        <tbody>
            <% List<Product> list = (List<Product>)request.getAttribute("list");
               if(list!=null){ for(Product p : list){ %>
            <tr><td><%=p.getProductId()%></td><td><%=p.getProductName()%></td><td><%=p.getCategory()%></td><td><%=p.getPrice()%></td><td><%=p.getQuantity()%></td></tr>
            <% }} %>
        </tbody>
    </table>
</div>