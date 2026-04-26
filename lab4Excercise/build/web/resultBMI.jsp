<%-- 
    Document   : resultBMI
    Created on : 27 Apr 2026, 1:12:14 am
    Author     : zynsz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>BMI Result</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="container">
        <%@ include file="header.jsp" %>
        
        <div class="card">
            <h1 class="form-title">Your BMI Result</h1>
            
            <%
                // Retrieve forwarded parameters using request.getParameter()
                String weightStr = request.getParameter("weight");
                String heightStr = request.getParameter("height");
                String bmiStr = request.getParameter("bmi");
                String category = request.getParameter("category");
                
                // Default values if parameters are null
                if (weightStr == null) weightStr = "0.00";
                if (heightStr == null) heightStr = "0.00";
                if (bmiStr == null) bmiStr = "0.00";
                if (category == null) category = "Not calculated";
                
                // Determine color for category
                String categoryColor = "#333";
                if ("Underweight".equals(category)) {
                    categoryColor = "#ffc107";
                } else if ("Normal".equals(category)) {
                    categoryColor = "#28a745";
                } else if ("Overweight".equals(category)) {
                    categoryColor = "#dc3545";
                }
            %>
            
            <div class="result-grid">
                <div class="result-box">
                    <h3>Input Information</h3>
                    <div class="result-group">
                        <label>Weight:</label>
                        <p><%= weightStr %> kg</p>
                    </div>
                    <div class="result-group">
                        <label>Height:</label>
                        <p><%= heightStr %> m</p>
                    </div>
                </div>
                
                <div class="result-box">
                    <h3>BMI Result</h3>
                    <div class="result-group">
                        <label>BMI Value:</label>
                        <p><strong><%= bmiStr %></strong></p>
                    </div>
                    <div class="result-group">
                        <label>Category:</label>
                        <p style="color: <%= categoryColor %>; font-weight: bold;">
                            <%= category %>
                        </p>
                    </div>
                </div>
            </div>
            
            <div class="info-card">
                <h3>BMI Category Guide:</h3>
                <p><strong>Underweight:</strong> BMI less than 18.5</p>
                <p><strong>Normal:</strong> BMI between 18.5 and 25.0</p>
                <p><strong>Overweight:</strong> BMI greater than 25.0</p>
            </div>
            
            <div class="button-group">
                <a href="bmiCalculator.jsp" class="btn btn-back">Calculate Again</a>
                <a href="healthInfo.jsp" class="btn btn-submit">View Health Information</a>
            </div>
        </div>
        
        <%@ include file="footer.jsp" %>
    </div>
</body>
</html>