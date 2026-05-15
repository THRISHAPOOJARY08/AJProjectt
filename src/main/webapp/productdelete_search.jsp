<%@ include file="navbar.jsp" %>
<div class="container col-md-4 card p-4 shadow">
    <h3>Delete Search</h3>
    <% if(request.getParameter("msg")!=null){ %><p class="text-danger"><%=request.getParameter("msg")%></p><% } %>
    <form action="DeleteProductServlet" method="get">
        <label>Enter ID to Delete:</label>
        <input type="number" name="id" class="form-control my-3" required>
        <button class="btn btn-danger w-100">Search</button>
    </form>
</div>