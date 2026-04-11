package com.lab.dao;

import com.lab.model.Product;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet; 
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    
    // Database connection details - VERIFY THESE
    private String jdbcURL = "jdbc:mysql://localhost:3306/CSE3023";
    private String jdbcUsername = "root";
    private String jdbcPassword = "admin"; 
    
    // Method to get database connection 
    protected Connection getConnection() {
        Connection connection = null;
        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Create connection
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
            
            // Test if connection is successful
            if (connection != null) {
                System.out.println("Database connected successfully!");
            }
            
        } catch (ClassNotFoundException e) {
            System.out.println("MySQL JDBC Driver not found!");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("Connection failed! Check your database settings.");
            System.out.println("Error: " + e.getMessage());
            e.printStackTrace();
        }
        return connection;
    }
    
    // CREATE: Insert a new product
    public void insertProduct(Product product) {
        String sql = "INSERT INTO products (name, category, price, quantity) VALUES (?, ?, ?, ?)";
        
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, product.getName());
            pstmt.setString(2, product.getCategory());
            pstmt.setDouble(3, product.getPrice());
            pstmt.setInt(4, product.getQuantity());
            
            pstmt.executeUpdate();
            System.out.println("Product inserted successfully!");
            
        } catch (SQLException e) {
            System.out.println("Error inserting product: " + e.getMessage());
            e.printStackTrace();
        } catch (NullPointerException e) {
            System.out.println("Database connection is null! Please check your MySQL service.");
            e.printStackTrace();
        }
    }
    
    // READ: Select all products
    public List<Product> selectAllProducts() {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM products";
        
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String category = rs.getString("category");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");
                
                products.add(new Product(id, name, category, price, quantity));
            }
            System.out.println("Retrieved " + products.size() + " products");
            
        } catch (SQLException e) {
            System.out.println("Error retrieving products: " + e.getMessage());
            e.printStackTrace();
        } catch (NullPointerException e) {
            System.out.println("Database connection is null!");
            e.printStackTrace();
        }
        
        return products;
    }
    
    // READ: Select a single product by ID
    public Product selectProduct(int id) {
        Product product = null;
        String sql = "SELECT * FROM products WHERE id = ?";
        
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                String name = rs.getString("name");
                String category = rs.getString("category");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");
                
                product = new Product(id, name, category, price, quantity);
            }
            
            rs.close();
            
        } catch (SQLException e) {
            System.out.println("Error retrieving product: " + e.getMessage());
            e.printStackTrace();
        } catch (NullPointerException e) {
            System.out.println("Database connection is null!");
            e.printStackTrace();
        }
        
        return product;
    }
    
    // UPDATE: Update product information
    public boolean updateProduct(Product product) {
        boolean rowUpdated = false;
        String sql = "UPDATE products SET name = ?, category = ?, price = ?, quantity = ? WHERE id = ?";
        
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, product.getName());
            pstmt.setString(2, product.getCategory());
            pstmt.setDouble(3, product.getPrice());
            pstmt.setInt(4, product.getQuantity());
            pstmt.setInt(5, product.getId());
            
            rowUpdated = pstmt.executeUpdate() > 0;
            System.out.println("Product updated successfully!");
            
        } catch (SQLException e) {
            System.out.println("Error updating product: " + e.getMessage());
            e.printStackTrace();
        } catch (NullPointerException e) {
            System.out.println("Database connection is null!");
            e.printStackTrace();
        }
        
        return rowUpdated;
    }
    
    // DELETE: Delete a product
    public boolean deleteProduct(int id) {
        boolean rowDeleted = false;
        String sql = "DELETE FROM products WHERE id = ?";
        
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, id);
            rowDeleted = pstmt.executeUpdate() > 0;
            System.out.println("Product deleted successfully!");
            
        } catch (SQLException e) {
            System.out.println("Error deleting product: " + e.getMessage());
            e.printStackTrace();
        } catch (NullPointerException e) {
            System.out.println("Database connection is null!");
            e.printStackTrace();
        }
        
        return rowDeleted;
    }
}