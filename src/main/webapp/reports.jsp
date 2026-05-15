<%@ page import="com.dao.ProductDAO, java.util.*" %>
<%@ include file="navbar.jsp" %>
<div class="container col-md-4 card p-4 shadow">
    <h3 class="text-center mb-4">Generate Reports</h3>
    <form action="ReportCriteriaServlet" method="get">
        <label class="fw-bold">Report Type:</label>
        <select name="type" id="t" class="form-select mb-3" onchange="toggleInputs()">
            <option value="category">Category-wise</option>
            <option value="price">Price (Value-wise - Price >)</option>
            <option value="top">Top Stocked Products (Limit)</option>
        </select>
        
        <!-- Category Dropdown (Shown by default) -->
        <div id="catDiv">
            <label class="fw-bold">Select Category:</label>
            <select name="val_cat" class="form-select mb-3">
                <% 
                    List<String> categories = new ProductDAO().getUniqueCategories();
                    for(String cat : categories) {
                %>
                    <option value="<%=cat%>"><%=cat%></option>
                <% } %>
            </select>
        </div>

        <!-- Numeric/Text Input (Hidden by default, used for Price and Top) -->
        <div id="valDiv" style="display:none;">
            <label id="inputLabel" class="fw-bold">Enter Value:</label>
            <input type="number" name="val_num" class="form-control mb-3" placeholder="e.g. 500">
        </div>

        <!-- Hidden field to send final 'val' to servlet -->
        <input type="hidden" name="val" id="finalVal">

        <button type="submit" class="btn btn-info w-100 text-white fw-bold" onclick="prepareSubmit()">Generate Report</button>
    </form>
</div>

<script>
    function toggleInputs() {
        let type = document.getElementById("t").value;
        let catDiv = document.getElementById("catDiv");
        let valDiv = document.getElementById("valDiv");
        let label = document.getElementById("inputLabel");

        if (type === "category") {
            catDiv.style.display = "block";
            valDiv.style.display = "none";
        } else {
            catDiv.style.display = "none";
            valDiv.style.display = "block";
            label.innerText = (type === "price") ? "Enter Min Price:" : "How many items?";
        }
    }

    function prepareSubmit() {
        let type = document.getElementById("t").value;
        let finalVal = document.getElementById("finalVal");
        
        if(type === "category") {
            finalVal.value = document.getElementsByName("val_cat")[0].value;
        } else {
            finalVal.value = document.getElementsByName("val_num")[0].value;
        }
    }
</script>