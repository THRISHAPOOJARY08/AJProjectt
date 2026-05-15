package com.dao;
import java.sql.*;
import java.util.*;
import com.model.Product;

public class ProductDAO {
    private String url = "jdbc:mysql://localhost:3306/product_db";
    private String user = "root"; 
    private String pass = "THRISHA"; 

    public Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(url, user, pass);
    }

    // FIXED: Reliable way to get next ID
    public int getNextAutoId() throws Exception {
        int nextId = 101; // Start from 101 if table is empty
        try (Connection con = getConnection(); Statement st = con.createStatement()) {
            ResultSet rs = st.executeQuery("SELECT MAX(ProductID) FROM Products");
            if (rs.next() && rs.getInt(1) > 0) {
                nextId = rs.getInt(1) + 1;
            }
        }
        return nextId;
    }

    public void addProduct(Product p) throws Exception {
        String sql = "INSERT INTO Products (ProductName, Category, Price, Quantity) VALUES (?, ?, ?, ?)";
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, p.getProductName()); ps.setString(2, p.getCategory());
            ps.setDouble(3, p.getPrice()); ps.setInt(4, p.getQuantity());
            ps.executeUpdate();
        }
    }

    public Product getProductById(int id) throws Exception {
        Product p = null;
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement("SELECT * FROM Products WHERE ProductID=?")) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) p = new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getInt(5));
        }
        return p;
    }

    public void updateProduct(Product p) throws Exception {
        String sql = "UPDATE Products SET ProductName=?, Category=?, Price=?, Quantity=? WHERE ProductID=?";
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, p.getProductName()); ps.setString(2, p.getCategory());
            ps.setDouble(3, p.getPrice()); ps.setInt(4, p.getQuantity());
            ps.setInt(5, p.getProductId());
            ps.executeUpdate();
        }
    }

    public void deleteProduct(int id) throws Exception {
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement("DELETE FROM Products WHERE ProductID=?")) {
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }

    public List<Product> getAllProducts() throws Exception {
        List<Product> list = new ArrayList<>();
        try (Connection con = getConnection(); Statement st = con.createStatement()) {
            ResultSet rs = st.executeQuery("SELECT * FROM Products");
            while(rs.next()) list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getInt(5)));
        }
        return list;
    }

    // FIXED: Case-Insensitive Search using LIKE
    public List<Product> getReport(String type, String val) throws Exception {
        List<Product> list = new ArrayList<>();
        String sql = type.equals("category") ? "SELECT * FROM Products WHERE Category LIKE ?" : "SELECT * FROM Products WHERE Price > ?";
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            if(type.equals("category")) ps.setString(1, val);
            else ps.setDouble(1, Double.parseDouble(val));
            ResultSet rs = ps.executeQuery();
            while(rs.next()) list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getInt(5)));
        }
        return list;
    }

    public List<Product> getTopProducts(int limit) throws Exception {
        List<Product> list = new ArrayList<>();
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement("SELECT * FROM Products ORDER BY Quantity DESC LIMIT ?")) {
            ps.setInt(1, limit);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getInt(5)));
        }
        return list;
    }

    // NEW: Get all distinct categories for the dropdown
    public List<String> getUniqueCategories() throws Exception {
        List<String> cats = new ArrayList<>();
        try (Connection con = getConnection(); Statement st = con.createStatement()) {
            ResultSet rs = st.executeQuery("SELECT DISTINCT Category FROM Products");
            while(rs.next()) cats.add(rs.getString(1));
        }
        return cats;
    }
}