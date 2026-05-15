<%@ include file="navbar.jsp" %>

<style>
    /* Soft Aesthetic Theme */
    body {
        background: linear-gradient(135deg, #fdfbfb, #ebedee);
        font-family: 'Poppins', sans-serif;
    }

    .dashboard-card {
        max-width: 500px;
        margin: 50px auto;
        padding: 35px;
        background: rgba(255, 255, 255, 0.9);
        border-radius: 20px;
        box-shadow: 0 8px 25px rgba(0,0,0,0.08);
        backdrop-filter: blur(8px);
    }

    h2 {
        color: #444;
        font-weight: 700;
        margin-bottom: 25px;
    }

    /* Aesthetic Buttons */
    .btn-aesthetic {
        display: block;
        width: 100%;
        padding: 15px;
        margin-bottom: 14px;
        border-radius: 14px;
        text-decoration: none;
        font-size: 16px;
        font-weight: 600;
        color: #333;
        transition: all 0.3s ease;
        border: none;
    }

    .btn-aesthetic:hover {
        transform: translateY(-3px);
        box-shadow: 0 6px 14px rgba(0,0,0,0.08);
        filter: brightness(0.97);
    }

    /* Soft pastel colors */
    .opt-add    { background: #d4f8d4; }   /* pastel green */
    .opt-update { background: #dbeafe; }   /* pastel blue */
    .opt-delete { background: #ffe0e6; }   /* pastel pink */
    .opt-report { background: #fff3cd; }   /* pastel yellow */
    .opt-view   { background: #eadcff; }   /* pastel lavender */

    .alert-success {
        background: #f0fff4;
        color: #2f855a;
        padding: 12px;
        border-radius: 10px;
        margin-bottom: 15px;
        font-size: 14px;
    }

    .text-muted {
        color: #888;
        font-size: 0.85rem;
    }
</style>

<div class="container text-center">
    <div class="dashboard-card">
        <h2>Product Management</h2>

        <% if(request.getParameter("msg")!=null){ %>
            <div class="alert-success">
                 <%=request.getParameter("msg")%>
            </div>
        <% } %>

        <a href="productadd.jsp" class="btn-aesthetic opt-add">Add New Product</a>
        <a href="productupdate_search.jsp" class="btn-aesthetic opt-update">Update Existing Product</a>
        <a href="productdelete_search.jsp" class="btn-aesthetic opt-delete">Remove Product</a>
        <a href="reports.jsp" class="btn-aesthetic opt-report">Inventory Reports</a>
        <a href="DisplayProductsServlet" class="btn-aesthetic opt-view">View All Inventory</a>

        <p class="text-muted mt-4">Logged in as Administrator</p>
    </div>
</div>