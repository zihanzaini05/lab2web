<%-- 
    Document   : healthInfo
    Created on : 27 Apr 2026, 1:12:45 am
    Author     : zynsz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>  <%-- JSP Page Directive to import Java API --%>
<!DOCTYPE html>
<html>
<head>
    <title>Health Information</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="container">
        <%@ include file="header.jsp" %>
        
        <div class="card">
            <h1 class="form-title">Health Information</h1>
            <p>Understanding your Body Mass Index (BMI) categories.</p>
            
            <%
                // Store BMI categories using ArrayList
                ArrayList<String[]> bmiCategories = new ArrayList<String[]>();
                
                // Add category data: [Category Name, BMI Range, Health Risk]
                bmiCategories.add(new String[]{"Underweight", "< 18.5", "Risk of malnutrition, osteoporosis"});
                bmiCategories.add(new String[]{"Normal", "18.5 - 25.0", "Low risk, healthy weight"});
                bmiCategories.add(new String[]{"Overweight", "> 25.0", "Risk of heart disease, diabetes"});
            %>
            
            <div class="info-card">
                <p><strong>Total BMI Categories:</strong> <%= bmiCategories.size() %></p>
                <p>BMI is a measure of body fat based on height and weight.</p>
            </div>
            
            <h3>BMI Categories Table:</h3>
            <table class="data-table">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Category</th>
                        <th>BMI Range</th>
                        <th>Health Risk</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        // Dynamically display the categories in HTML table using loop
                        for (int i = 0; i < bmiCategories.size(); i++) {
                            String[] category = bmiCategories.get(i);
                    %>
                    <tr>
                        <td><%= i + 1 %></td>
                        <td><strong><%= category[0] %></strong></td>
                        <td><%= category[1] %></td>
                        <td><%= category[2] %></td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
            
            <h3 style="margin-top: 30px;">Tips for Healthy BMI:</h3>
            <ul style="margin-left: 20px;">
                <li>Eat a balanced diet with fruits and vegetables</li>
                <li>Exercise regularly (at least 30 minutes per day)</li>
                <li>Get enough sleep (7-8 hours per night)</li>
                <li>Stay hydrated by drinking plenty of water</li>
            </ul>
            
            <div class="button-group" style="margin-top: 30px;">
                <a href="bmiCalculator.jsp" class="btn btn-back">Calculate BMI</a>
            </div>
        </div>
        
        <%@ include file="footer.jsp" %>
    </div>
</body>
</html>
