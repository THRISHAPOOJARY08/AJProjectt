<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Management System</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Google Fonts for better aesthetics -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    
    <style>
        body { 
            /* Light Baby Purple Background for all pages */
            background-color: #f8f4ff; 
            font-family: 'Poppins', sans-serif;
        }

        /* Modern White Navbar with Purple Accents */
        .navbar {
            background-color: #ffffff !important;
            border-bottom: 2px solid #e1bee7;
            padding: 0.8rem 0;
        }

        .navbar-brand { 
            font-weight: 600; 
            letter-spacing: 0.5px; 
            color: #6a1b9a !important; /* Deep Purple */
        }

        .nav-link {
            color: #7b1fa2 !important;
            font-weight: 500;
            margin-left: 15px;
        }

        .nav-link:hover { 
            color: #9c27b0 !important; 
            transform: translateY(-1px);
            transition: 0.2s; 
        }

        /* Style for the buttons in your index page */
        .card { 
            border-radius: 15px; 
            border: none;
            box-shadow: 0 4px 15px rgba(156, 39, 176, 0.08);
        }

        /* Custom scrollbar for aesthetic feel */
        ::-webkit-scrollbar {
            width: 8px;
        }
        ::-webkit-scrollbar-track {
            background: #f3e5f5;
        }
        ::-webkit-scrollbar-thumb {
            background: #ce93d8;
            border-radius: 10px;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light shadow-sm mb-4">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">
            <span style="background: #f3e5f5; padding: 5px 10px; border-radius: 10px;">📦</span> 
            ProductApp
        </a>
        
        <!-- Mobile Toggle Button -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        
        <!-- Navbar links -->
        <div class="collapse navbar-collapse" id="navbarNav">
            <div class="navbar-nav ms-auto">
                <a class="nav-link" href="index.jsp">Home</a>
                <a class="nav-link" href="DisplayProductsServlet">View Inventory</a>
                
            </div>
        </div>
    </div>
</nav>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>