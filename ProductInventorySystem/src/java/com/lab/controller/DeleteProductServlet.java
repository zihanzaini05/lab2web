/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.lab.controller;

import com.lab.dao.ProductDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteProductServlet extends HttpServlet {
    
    private ProductDAO productDAO;
    
    @Override
    public void init() {
        productDAO = new ProductDAO();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Get product ID from URL parameter
        int id = Integer.parseInt(request.getParameter("id"));
        
        // Call DAO to delete
        productDAO.deleteProduct(id);
        
        // Redirect back to view page
        response.sendRedirect("ViewProductServlet");
    }
}