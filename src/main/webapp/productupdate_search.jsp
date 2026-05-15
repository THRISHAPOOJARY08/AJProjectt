<%@ include file="navbar.jsp" %>
<div class="container col-md-4 card p-4 shadow">
    <h3>Update Search</h3>
    <% if(request.getParameter("msg")!=null){ %><p class="text-danger"><%=request.getParameter("msg")%></p><% } %>
    <form action="UpdateProductServlet" method="get">
        <label>Enter ID to Update:</label>
        <input type="number" name="id" class="form-control my-3" required>
        <button class="btn btn-warning w-100">Find</button>
    </form>
</div>