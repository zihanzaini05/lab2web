/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.lab.controller;

import com.lab.dao.ProductDAO;
import com.lab.model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ViewProductServlet extends HttpServlet {
    
    private ProductDAO productDAO;
    
    @Override
    public void init() {
        productDAO = new ProductDAO();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        // Get all products from DAO
        List<Product> productList = productDAO.selectAllProducts();
        
        // Generate HTML output
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Product List</title>");
        out.println("<style>");
        out.println("body { font-family: Arial, sans-serif; margin: 50px; background-color: #f4f4f4; }");
        out.println(".container { max-width: 1000px; margin: auto; background: white; padding: 20px; border-radius: 10px; }");
        out.println("h2 { text-align: center; color: #333; }");
        out.println("table { width: 100%; border-collapse: collapse; margin-top: 20px; }");
        out.println("th, td { padding: 12px; text-align: left; border-bottom: 1px solid #ddd; }");
        out.println("th { background-color: #007bff; color: white; }");
        out.println("tr:hover { background-color: #f5f5f5; }");
        out.println(".add-link { display: inline-block; margin-bottom: 20px; padding: 10px 15px; background-color: #28a745; "
                + "color: white; text-decoration: none; border-radius: 4px; }");
        out.println(".add-link:hover { background-color: #218838; }");
        out.println(".edit { color: #ffc107; text-decoration: none; margin-right: 10px; }");
        out.println(".delete { color: #dc3545; text-decoration: none; }");
        out.println(".edit:hover { color: #e0a800; }");
        out.println(".delete:hover { color: #c82333; }");
        out.println("</style>");
        out.println("</head>");
        out.println("<body>");
        out.println("<div class='container'>");
        out.println("<h2>Product Inventory List</h2>");
        out.println("<a href='add_product.html' class='add-link'>+ Add New Product</a>");
        
        out.println("<table>");
        out.println("<tr>");
        out.println("<th>ID</th>");
        out.println("<th>Name</th>");
        out.println("<th>Category</th>");
        out.println("<th>Price ($)</th>");
        out.println("<th>Quantity</th>");
        out.println("<th>Actions</th>");
        out.println("</tr>");
        
        for (Product product : productList) {
            out.println("<tr>");
            out.println("<td>" + product.getId() + "</td>");
            out.println("<td>" + product.getName() + "</td>");
            out.println("<td>" + product.getCategory() + "</td>");
            out.println("<td>$" + String.format("%.2f", product.getPrice()) + "</td>");
            out.println("<td>" + product.getQuantity() + "</td>");
            out.println("<td>");
            out.println("<a href='UpdateProductServlet?id=" + product.getId() + "' class='edit'>Edit</a> | ");
            out.println("<a href='DeleteProductServlet?id=" + product.getId() + "' class='delete' onclick='return confirm(\"Are you sure you want to delete this product?\")'>Delete</a>");
            out.println("</td>");
            out.println("</tr>");
        }
        
        out.println("</table>");
        out.println("</div>");
        out.println("</body>");
        out.println("</html>");
    }
}